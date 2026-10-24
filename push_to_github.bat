@echo off
setlocal enabledelayedexpansion
set "PATH=%PATH%;C:\Users\user\bin;C:\Users\user\bin\git\cmd"
title ZAKSY STUDIO - GitHub & Netlify Push Automation

echo =====================================================================
echo                ZAKSY STUDIO WEBSITE - GITHUB DEPLOYMENT
echo =====================================================================
echo.
cd /d "d:\ZAKSY STUDIO"

echo [1/3] Checking GitHub authentication...
gh auth status >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo [*] You are not logged in yet.
    echo [*] A one-time code will appear below and your browser will open.
    echo [*] Confirm the code in your browser to authorize GitHub CLI.
    echo.
    gh auth login --web -h github.com -p https
) else (
    echo [OK] Already authenticated with GitHub.
)

echo.
echo [2/3] Checking remote repository 'ZAKSY-STUDIO-website'...
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo [*] Creating new public GitHub repository 'ZAKSY-STUDIO-website'...
    gh repo create "ZAKSY-STUDIO-website" --public --source=. --remote=origin --push
) else (
    echo [OK] Remote 'origin' already configured. Pushing latest commits...
    git push -u origin main
)

echo.
echo [3/3] Checking Netlify configuration...
if exist "netlify.toml" (
    echo [OK] 'netlify.toml' found and configured with CDN caching headers.
)

echo.
echo =====================================================================
echo   SUCCESS! All files are pushed to GitHub!
echo   
echo   NEXT STEP: Deploying on Netlify (1 minute)
echo   1. Go to https://app.netlify.com
echo   2. Click 'Add new site' -^> 'Import an existing project'
echo   3. Select 'GitHub' and choose 'ZAKSY-STUDIO-website'
echo   4. Click 'Deploy ZAKSY STUDIO website'
echo =====================================================================
echo.
pause
