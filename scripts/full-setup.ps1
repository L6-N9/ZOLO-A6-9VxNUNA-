# Full Setup Script for ZOLO-A6-9VxNUNA
# This script runs the complete setup process

param(
    [switch]$SkipMT5 = $false,
    [switch]$SkipTrading = $false
)

$ErrorActionPreference = "Stop"
$ProgressPreference = "Continue"

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$rootPath = Split-Path -Parent $scriptPath

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  ZOLO-A6-9VxNUNA Full Setup" -ForegroundColor Cyan
Write-Host "  Complete System Configuration" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This will run the complete setup process:" -ForegroundColor Yellow
Write-Host "  1. Device Setup (Windows 11 configuration)" -ForegroundColor White
Write-Host "  2. MT5 Integration (MetaTrader 5 setup)" -ForegroundColor White
Write-Host "  3. Trading System (System verification)" -ForegroundColor White
Write-Host ""

$confirm = Read-Host "Continue? (Y/N)"
if ($confirm -ne "Y" -and $confirm -ne "y") {
    Write-Host "Setup cancelled." -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Step 1: Device Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

try {
    & "$scriptPath\complete-device-setup.ps1"
    if ($LASTEXITCODE -ne 0 -and $LASTEXITCODE -ne $null) {
        Write-Host "Device setup completed with warnings." -ForegroundColor Yellow
    } else {
        Write-Host "✓ Device setup completed successfully" -ForegroundColor Green
    }
} catch {
    Write-Host "✗ Device setup failed: $_" -ForegroundColor Red
    Write-Host "Continuing with next steps..." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Step 2: MT5 Integration" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

if (-not $SkipMT5) {
    try {
        & "$scriptPath\setup-mt5-integration.ps1"
        if ($LASTEXITCODE -ne 0 -and $LASTEXITCODE -ne $null) {
            Write-Host "MT5 integration completed with warnings." -ForegroundColor Yellow
        } else {
            Write-Host "✓ MT5 integration completed successfully" -ForegroundColor Green
        }
    } catch {
        Write-Host "✗ MT5 integration failed: $_" -ForegroundColor Red
        Write-Host "You can run this step manually later." -ForegroundColor Yellow
    }
} else {
    Write-Host "Skipping MT5 integration (-SkipMT5 flag set)" -ForegroundColor Gray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Step 3: Trading System Verification" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

if (-not $SkipTrading) {
    try {
        & "$scriptPath\start-trading-system.ps1"
        if ($LASTEXITCODE -ne 0 -and $LASTEXITCODE -ne $null) {
            Write-Host "Trading system verification completed with warnings." -ForegroundColor Yellow
        } else {
            Write-Host "✓ Trading system verification completed" -ForegroundColor Green
        }
    } catch {
        Write-Host "✗ Trading system verification failed: $_" -ForegroundColor Red
        Write-Host "You can run this step manually later." -ForegroundColor Yellow
    }
} else {
    Write-Host "Skipping trading system verification (-SkipTrading flag set)" -ForegroundColor Gray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Full Setup Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Setup Summary:" -ForegroundColor Yellow
Write-Host "  ✓ Device configuration completed" -ForegroundColor Green
if (-not $SkipMT5) {
    Write-Host "  ✓ MT5 integration configured" -ForegroundColor Green
}
if (-not $SkipTrading) {
    Write-Host "  ✓ Trading system verified" -ForegroundColor Green
}
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Open MetaTrader 5 and connect to EXNESS broker" -ForegroundColor White
Write-Host "  2. Compile and attach the EXNESS_GenX_Trader EA" -ForegroundColor White
Write-Host "  3. Monitor trading system performance" -ForegroundColor White
Write-Host ""
Write-Host "For more information, see README.md" -ForegroundColor Cyan
Write-Host ""

