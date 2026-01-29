@echo off
:menu
cls
echo ========================================
echo       Agent Skill Manager v2.0
echo       Powered by llmbill.com
echo ========================================
echo   1. Collect Skills (from skills.sh)
echo   2. Batch Pull (from CSV)
echo   3. Open Web Explorer (index.html)
echo   4. Open CSV Database
echo   5. Exit
echo ========================================
set /p opt=Enter your choice (1-5): 

if "%opt%"=="1" (
    echo [System] Starting Collector...
    powershell -ExecutionPolicy Bypass -File "%~dp0collector.ps1"
    echo.
    echo [System] Collector finished. Press any key to return to menu.
    pause > nul
    goto menu
)

if "%opt%"=="2" (
    echo [System] Starting Puller...
    powershell -ExecutionPolicy Bypass -File "%~dp0puller.ps1"
    echo.
    echo [System] Puller finished. Press any key to return to menu.
    pause > nul
    goto menu
)

if "%opt%"=="3" (
    echo [System] Opening Web Explorer...
    start "" "%~dp0index.html"
    goto menu
)

if "%opt%"=="4" (
    echo [System] Opening CSV file...
    start "" "%~dp0skills_database.csv"
    goto menu
)

if "%opt%"=="5" (
    echo Goodbye!
    exit
)

echo [Error] Invalid option. Press any key to try again.
pause > nul
goto menu
