@echo off
set "PATH=%PATH%;C:\Users\user\bin;C:\Users\user\bin\git\cmd"
echo ===================================================
echo   ZAKSY STUDIO WEBSITE - GITHUB PUSH HELPER
echo ===================================================
echo.
cd /d "d:\ZAKSY STUDIO"

echo Checking GitHub CLI login status...
gh auth status >nul 2>&1
if %errorlevel% neq 0 (
    echo You need to log in to GitHub first.
    echo Opening GitHub browser login...
    gh auth login --web --git-protocol https
)

echo.
echo Creating repository 'ZAKSY-STUDIO-website' and pushing all files...
gh repo create "ZAKSY-STUDIO-website" --public --source=. --remote=origin --push

echo.
echo ===================================================
echo   SUCCESS! Repository created and pushed to GitHub!
echo ===================================================
pause
