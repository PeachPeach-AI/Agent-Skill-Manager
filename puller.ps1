
# 1. Config
$BaseDir = $PSScriptRoot
$DatabaseFile = Join-Path $BaseDir "skills_database.csv"

# 设置环境变量，禁止 Git 弹出任何交互窗口（解决 /dev/tty 报错）
$env:GIT_TERMINAL_PROMPT = "0"

if (-not (Test-Path $DatabaseFile)) { return }

$Skills = Import-Csv $DatabaseFile -Encoding utf8
$UpdatedData = @()
$ProcessedRepos = @{}

Write-Host "--- BATCH PULLING START ---" -ForegroundColor Cyan

foreach ($Skill in $Skills) {
    if ($Skill.Status -eq "Success") {
        $UpdatedData += $Skill; continue
    }
    
    # 额外检查链接合法性
    if ($Skill.RepoUrl -match "claude\.com" -or $Skill.RepoUrl -match "w3\.org") {
        $Skill.Status = "Invalid Link"
        $UpdatedData += $Skill; continue
    }

    if ($ProcessedRepos.ContainsKey($Skill.RepoUrl)) {
        $Skill.Status = "Success (Skipped)"; $UpdatedData += $Skill; continue
    }

    Write-Host "`n[Action] Installing: $($Skill.SkillName)" -ForegroundColor White
    
    # 执行安装 (使用 --force 应对部分已存在的情况)
    $Output = npx skills add "$($Skill.RepoUrl)" 2>&1
    $OutputStr = $Output -join " "
    
    if ($LASTEXITCODE -eq 0 -or $OutputStr -like "*already installed*") {
        $Skill.Status = "Success"
        $ProcessedRepos[$Skill.RepoUrl] = $true
        Write-Host "++ OK" -ForegroundColor Green
    }
    else {
        $Skill.Status = "Failed"
        Write-Host "-- Failed: $OutputStr" -ForegroundColor Red
    }

    $UpdatedData += $Skill
    $UpdatedData | Export-Csv $DatabaseFile -NoTypeInformation -Encoding utf8
}
Write-Host "`n--- Finished ---" -ForegroundColor Yellow
