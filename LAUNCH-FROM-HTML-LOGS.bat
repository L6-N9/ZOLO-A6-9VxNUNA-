@echo off
:: ========================================
::   ZOLO Repository Launch from HTML Logs
::   Double-click to start!
:: ========================================

echo.
echo ========================================
echo   ZOLO Repository Launch
echo   Starting from HTML Trade Logs
echo ========================================
echo.
echo Opening HTML Trade Report and launching all systems...
echo.

cd /d "%~dp0"

:: Launch the PowerShell script
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0launch-from-html-logs.ps1"

echo.
echo ========================================
echo   Launch Complete!
echo ========================================
echo.
echo All systems should now be running.
echo Check the logs folder for details.
echo.

timeout /t 10
