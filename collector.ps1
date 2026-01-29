
# 1. 路径设置
$BaseDir = $PSScriptRoot
$DatabaseFile = Join-Path $BaseDir "skills_database.csv"
$TempFile = Join-Path $BaseDir "home_full.html"

# 2. 获取原始数据
$NeedsDownload = $false
if (-not (Test-Path $TempFile)) {
    $NeedsDownload = $true
}
elseif ((Get-Item $TempFile).Length -lt 1MB) {
    $NeedsDownload = $true
}

if ($NeedsDownload) {
    Write-Host ">>> Source missing or outdated. Downloading database (7.2MB)..." -ForegroundColor Yellow
    $UA = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"
    try {
        Invoke-WebRequest -Uri "https://skills.sh" -OutFile $TempFile -UserAgent $UA -TimeoutSec 120 -ErrorAction Stop
    }
    catch {
        Write-Host "!! Download Failed: $($_.Exception.Message)" -ForegroundColor Red
        # Fallback to curl if Invoke-WebRequest fails
        curl.exe -s -L -A "$UA" "https://skills.sh" -o $TempFile --connect-timeout 60
    }
}

# 再次检查文件是否存在
if (-not (Test-Path $TempFile) -or (Get-Item $TempFile).Length -lt 1MB) {
    Write-Host "!! Error: Source data file is missing or invalid. Please check your internet connection." -ForegroundColor Red
    return
}

Write-Host ">>> Loading flight data (7.2MB)..." -ForegroundColor Cyan
$RawContent = Get-Content $TempFile -Raw
if ([string]::IsNullOrEmpty($RawContent)) {
    Write-Host "!! Error: Failed to read source content." -ForegroundColor Red
    return
}

# 3. 寻找数据脚本块
$ScriptMatches = [regex]::Matches($RawContent, '<script[^>]*>(?<data>.*?)</script>', [System.Text.RegularExpressions.RegexOptions]::Singleline)
$BigData = ""
foreach ($m in $ScriptMatches) {
    if ($m.Groups['data'].Value.Length -gt 1MB) {
        $BigData = $m.Groups['data'].Value
        break
    }
}

if ([string]::IsNullOrEmpty($BigData)) {
    Write-Host "!! Error: Large data block not found in HTML." -ForegroundColor Red
    return
}

# 4. 暴力提取模式
# 模式: \"source\":\"owner/repo\",\"skillId\":\"skill-name\"
$Pattern = '\\"source\\":\\"(?<s>[^\\"]+)\\",\\"skillId\\":\\"(?<i>[^\\"]+)\\"'
$DataMatches = [regex]::Matches($BigData, $Pattern)

Write-Host ">>> Extraction complete. Processing $($DataMatches.Count) entries..." -ForegroundColor Yellow

$FinalList = New-Object System.Collections.Generic.List[PSCustomObject]
$Seen = @{}
$Now = (Get-Date).ToString("yyyy-MM-dd HH:mm")

foreach ($m in $DataMatches) {
    $OwnerRepo = $m.Groups['s'].Value
    $Skill = $m.Groups['i'].Value
    
    # 格式验证: owner/repo
    if (-not $OwnerRepo.Contains("/")) { continue }
    
    $Key = "$OwnerRepo/$Skill"
    if (-not $Seen.ContainsKey($Key)) {
        $FinalList.Add([PSCustomObject]@{
                CaptureDate   = $Now
                SkillName     = $Skill
                RepoUrl       = "https://github.com/$OwnerRepo"
                DownloadCount = "Full-Leak"
                Status        = "Pending"
            })
        $Seen[$Key] = $true
    }
}

Write-Host ">>> Unique skills found: $($FinalList.Count)" -ForegroundColor Green

# 5. 高速存入 CSV
if ($FinalList.Count -gt 0) {
    Write-Host ">>> Saving to database (This may take a moment)..." -ForegroundColor Cyan
    
    # 如果已有数据库，进行合并
    if (Test-Path $DatabaseFile) {
        $Existing = Import-Csv $DatabaseFile -Encoding utf8
        # 将现有数据加入 Seen，防止覆盖
        foreach ($e in $Existing) { $Seen["$($e.RepoUrl.Replace('https://github.com/',''))/$($e.SkillName)"] = $true }
        
        # 写入新数据 (追加模式)
        $FinalList | Export-Csv $DatabaseFile -NoTypeInformation -Encoding utf8 -Append
    }
    else {
        $FinalList | Export-Csv $DatabaseFile -NoTypeInformation -Encoding utf8
    }
    
    Write-Host "`n>>> [MISSION ACCOMPLISHED]" -ForegroundColor Green
    Write-Host "Extracted all $($FinalList.Count) skills hidden in the site's background." -ForegroundColor White

    # --- NEW: Generate data.js for Web Explorer (No-Server Fix) ---
    Write-Host ">>> Updating Web Explorer data cache..." -ForegroundColor Cyan
    $FullCsv = Get-Content $DatabaseFile -Raw
    $JsonEscaped = $FullCsv -replace "\\", "\\\\" -replace '"', '\"' -replace "`r", "" -replace "`n", "\n"
    "window.SKILLS_CSV_DATA = `"$JsonEscaped`";" | Out-File -FilePath (Join-Path $BaseDir "data.js") -Encoding utf8
}
