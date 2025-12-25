#Requires -Version 5.1
<#
.SYNOPSIS
    Configures GitHub account for git operations
.DESCRIPTION
    Sets git user.name and user.email based on the specified account
.PARAMETER Account
    The GitHub account name: "Mouy-leng" (personal) or "A6-9V" (organization)
.PARAMETER SetGlobal
    If specified, sets the configuration globally. Otherwise sets it locally for the current repository
.EXAMPLE
    .\configure-github-account.ps1 -Account "Mouy-leng" -SetGlobal
.EXAMPLE
    .\configure-github-account.ps1 -Account "A6-9V"
#>

param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("Mouy-leng", "A6-9V")]
    [string]$Account,
    
    [switch]$SetGlobal
)

$ErrorActionPreference = "Continue"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  GitHub Account Configuration" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Define account configurations
$accountConfigs = @{
    "Mouy-leng" = @{
        UserName = "Mouy-leng"
        UserEmail = "Mouy-leng@users.noreply.github.com"
        Type = "Personal"
    }
    "A6-9V" = @{
        UserName = "A6-9V"
        UserEmail = "A6-9V@users.noreply.github.com"
        Type = "Organization"
    }
}

$config = $accountConfigs[$Account]

if (-not $config) {
    Write-Host "[ERROR] Invalid account: $Account" -ForegroundColor Red
    Write-Host "Valid accounts: Mouy-leng, A6-9V" -ForegroundColor Yellow
    exit 1
}

$scope = if ($SetGlobal) { "global" } else { "local" }

Write-Host "[INFO] Configuring GitHub account: $Account ($($config.Type))" -ForegroundColor Yellow
Write-Host "[INFO] Scope: $scope" -ForegroundColor Cyan
Write-Host ""

try {
    # Configure git user.name
    if ($SetGlobal) {
        git config --global user.name $config.UserName
    } else {
        git config --local user.name $config.UserName
    }
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] Set user.name: $($config.UserName)" -ForegroundColor Green
    } else {
        Write-Host "[ERROR] Failed to set user.name" -ForegroundColor Red
        exit 1
    }
    
    # Configure git user.email
    if ($SetGlobal) {
        git config --global user.email $config.UserEmail
    } else {
        git config --local user.email $config.UserEmail
    }
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[OK] Set user.email: $($config.UserEmail)" -ForegroundColor Green
    } else {
        Write-Host "[ERROR] Failed to set user.email" -ForegroundColor Red
        exit 1
    }
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "  Configuration Complete" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "Account: $Account ($($config.Type))" -ForegroundColor White
    Write-Host "Scope: $scope" -ForegroundColor White
    Write-Host "User: $($config.UserName)" -ForegroundColor White
    Write-Host "Email: $($config.UserEmail)" -ForegroundColor White
    Write-Host ""
    
    # Verify configuration
    Write-Host "Verifying configuration..." -ForegroundColor Yellow
    if ($SetGlobal) {
        $verifyName = git config --global user.name
        $verifyEmail = git config --global user.email
    } else {
        $verifyName = git config --local user.name
        $verifyEmail = git config --local user.email
    }
    
    Write-Host "  Current user.name: $verifyName" -ForegroundColor Cyan
    Write-Host "  Current user.email: $verifyEmail" -ForegroundColor Cyan
    
    if ($verifyName -eq $config.UserName -and $verifyEmail -eq $config.UserEmail) {
        Write-Host "[OK] Configuration verified successfully" -ForegroundColor Green
    } else {
        Write-Host "[WARNING] Configuration verification mismatch" -ForegroundColor Yellow
    }
    
} catch {
    Write-Host "[ERROR] Failed to configure GitHub account: $_" -ForegroundColor Red
    exit 1
}

Write-Host ""

