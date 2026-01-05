#Requires -Version 5.1
<#
.SYNOPSIS
    Launch Repository from HTML Trade Logs
.DESCRIPTION
    Opens the ReportTrade HTML log file and launches the complete repository startup sequence.
    This script provides a unified entry point using the HTML trading logs as a launch reference.
.PARAMETER HtmlLogPath
    Path to the HTML log file. Defaults to J:\OneDrive-Backup-20251227-002233\ReportTrade-279410452.html
.PARAMETER SkipLogOpen
    Skip opening the HTML log file and only launch the repository
.EXAMPLE
    .\launch-from-html-logs.ps1
    Opens the HTML log and launches all repository systems
.EXAMPLE
    .\launch-from-html-logs.ps1 -SkipLogOpen
    Launches repository without opening HTML log
#>

param(
    [string]$HtmlLogPath = "J:\OneDrive-Backup-20251227-002233\ReportTrade-279410452.html",
    [switch]$SkipLogOpen
)

$ErrorActionPreference = "Continue"

# Color functions for output
function Write-Header {
    param([string]$Message)
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "  $Message" -ForegroundColor Cyan
    Write-Host "========================================" -ForegroundColor Cyan
}

function Write-Status {
    param([string]$Message, [string]$Status = "INFO")
    $color = switch($Status) {
        "OK" { "Green" }
        "INFO" { "Cyan" }
        "WARNING" { "Yellow" }
        "ERROR" { "Red" }
        default { "White" }
    }
    Write-Host "[$Status] $Message" -ForegroundColor $color
}

# Log file for launch tracking
$logDir = Join-Path $PSScriptRoot "logs"
if (-not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null
}
$launchLogFile = Join-Path $logDir "html-launch-log.txt"

function Write-LaunchLog {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] $Message"
    Add-Content -Path $launchLogFile -Value $logMessage -ErrorAction SilentlyContinue
    Write-Status $Message "INFO"
}

Write-Header "ZOLO Repository Launch from HTML Logs"

Write-LaunchLog "Starting repository launch sequence"
Write-LaunchLog "HTML Log Path: $HtmlLogPath"

# Step 1: Open HTML Log File
if (-not $SkipLogOpen) {
    Write-Status "Opening HTML Trade Report Log..." "INFO"
    
    if (Test-Path $HtmlLogPath) {
        try {
            Start-Process $HtmlLogPath
            Write-LaunchLog "HTML log opened successfully: $HtmlLogPath"
            Write-Status "HTML log opened in default browser" "OK"
        } catch {
            Write-Status "Failed to open HTML log: $_" "WARNING"
            Write-LaunchLog "Warning: Could not open HTML log - $_"
        }
    } else {
        Write-Status "HTML log file not found at: $HtmlLogPath" "WARNING"
        Write-LaunchLog "Warning: HTML log file not found"
        
        # Try to find the file in common locations
        $searchPaths = @(
            "J:\OneDrive-Backup-*\ReportTrade*.html",
            "$env:USERPROFILE\OneDrive\*Backup*\ReportTrade*.html",
            "D:\OneDrive*\ReportTrade*.html"
        )
        
        foreach ($searchPath in $searchPaths) {
            $foundFiles = Get-ChildItem -Path $searchPath -ErrorAction SilentlyContinue
            if ($foundFiles) {
                Write-Status "Found alternative HTML log: $($foundFiles[0].FullName)" "INFO"
                Write-LaunchLog "Using alternative HTML log: $($foundFiles[0].FullName)"
                Start-Process $foundFiles[0].FullName
                break
            }
        }
    }
    
    Start-Sleep -Seconds 2
}

# Step 2: Launch Repository Systems
Write-Header "Launching Repository Systems"

# 2a: Start VPS System if available
$vpsScript = Join-Path $PSScriptRoot "start-vps-system.ps1"
if (Test-Path $vpsScript) {
    Write-Status "Launching VPS System..." "INFO"
    try {
        Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$vpsScript`"" -WindowStyle Hidden
        Write-LaunchLog "VPS system launched"
        Write-Status "VPS system started" "OK"
    } catch {
        Write-Status "VPS system launch failed: $_" "WARNING"
        Write-LaunchLog "Warning: VPS system launch failed - $_"
    }
} else {
    Write-Status "VPS script not found, skipping" "WARNING"
}

Start-Sleep -Seconds 1

# 2b: Start Trading System if available
$tradingScript = Join-Path $PSScriptRoot "setup-and-start-trading-auto.ps1"
if (Test-Path $tradingScript) {
    Write-Status "Launching Trading System..." "INFO"
    try {
        Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$tradingScript`"" -WindowStyle Hidden
        Write-LaunchLog "Trading system launched"
        Write-Status "Trading system started" "OK"
    } catch {
        Write-Status "Trading system launch failed: $_" "WARNING"
        Write-LaunchLog "Warning: Trading system launch failed - $_"
    }
} else {
    Write-Status "Trading script not found, skipping" "WARNING"
}

Start-Sleep -Seconds 1

# 2c: Start the main system startup sequence
$startScript = Join-Path $PSScriptRoot "start.ps1"
if (Test-Path $startScript) {
    Write-Status "Launching main startup sequence..." "INFO"
    try {
        Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$startScript`"" -NoNewWindow
        Write-LaunchLog "Main startup sequence launched"
        Write-Status "Startup sequence initiated" "OK"
    } catch {
        Write-Status "Startup sequence launch failed: $_" "WARNING"
        Write-LaunchLog "Warning: Startup sequence launch failed - $_"
    }
}

Start-Sleep -Seconds 1

# 2d: Open GitHub Pages website
Write-Status "Opening GitHub Pages website..." "INFO"
$websiteUrl = "https://mouy-leng.github.io/ZOLO-A6-9VxNUNA-/"
try {
    Start-Process $websiteUrl
    Write-LaunchLog "GitHub Pages website opened"
    Write-Status "Website opened" "OK"
} catch {
    Write-Status "Failed to open website: $_" "WARNING"
}

# Step 3: Summary
Write-Header "Launch Complete"

Write-Status "Repository launch sequence completed!" "OK"
Write-Status "" "INFO"
Write-Status "Active Components:" "INFO"
Write-Status "  - HTML Trade Report Log" "INFO"
Write-Status "  - VPS Trading System" "INFO"
Write-Status "  - Trading Bridge" "INFO"
Write-Status "  - GitHub Pages Website" "INFO"
Write-Status "  - Repository Startup Scripts" "INFO"
Write-Status "" "INFO"
Write-Status "Launch log saved to: $launchLogFile" "INFO"
Write-Status "" "INFO"

Write-LaunchLog "Repository launch sequence completed successfully"

# Keep window open for a moment
Start-Sleep -Seconds 5
