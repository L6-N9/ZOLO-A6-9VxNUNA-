@echo off
REM Quick launcher for automated git workflow
REM Powered by @copilot @jules @cursor

echo ========================================
echo   Automated Git Workflow Launcher
echo   Copilot/Jules/Cursor Integration
echo ========================================
echo.

REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [INFO] Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo [INFO] Starting automated git workflow...
echo.

REM Run the PowerShell script
powershell -ExecutionPolicy Bypass -File "%~dp0auto-git-workflow.ps1" -Action auto

echo.
echo ========================================
echo   Workflow Complete!
echo ========================================
echo.

pause
