# HTML Log-Based Repository Launch System

## Overview

The ZOLO-A6-9VxNUNA repository now includes an HTML log-based launch system that uses the ReportTrade HTML log file as an entry point for launching all repository systems.

## What is HTML Log-Based Launch?

This system allows you to:
- Open your HTML trade report logs automatically
- Launch all repository components from a single command
- View trading history while systems start up
- Have a unified launch point for the entire trading environment

## Quick Start

### Option 1: Double-Click Launch (Easiest)

Simply double-click the file:
```
LAUNCH-FROM-HTML-LOGS.bat
```

This will:
1. Open the ReportTrade HTML log file in your default browser
2. Launch the VPS trading system
3. Start the trading bridge
4. Open the GitHub Pages website
5. Initialize all repository components

### Option 2: PowerShell Command

Run in PowerShell:
```powershell
.\launch-from-html-logs.ps1
```

### Option 3: Custom HTML Log Path

If your HTML log is in a different location:
```powershell
.\launch-from-html-logs.ps1 -HtmlLogPath "C:\Your\Path\ReportTrade.html"
```

### Option 4: Skip HTML Log Opening

Launch systems without opening the HTML log:
```powershell
.\launch-from-html-logs.ps1 -SkipLogOpen
```

## Configuration

### HTML Log Path Configuration

Edit `html-log-config.txt` to configure your HTML log location:

```
# Primary HTML Log Path
HTML_LOG_PATH=J:\OneDrive-Backup-20251227-002233\ReportTrade-279410452.html

# Alternative paths (will be tried in order if primary fails)
ALT_HTML_LOG_PATHS=J:\OneDrive-Backup*\ReportTrade*.html,$env:USERPROFILE\OneDrive\*Backup*\ReportTrade*.html

# Launch Options
OPEN_HTML_LOG_ON_STARTUP=true
LAUNCH_VPS_SYSTEM=true
LAUNCH_TRADING_SYSTEM=true
OPEN_GITHUB_WEBSITE=true
```

### Automatic Search

If the HTML log file is not found at the specified path, the system will automatically search:
- `J:\OneDrive-Backup-*\ReportTrade*.html`
- `%USERPROFILE%\OneDrive\*Backup*\ReportTrade*.html`
- `D:\OneDrive*\ReportTrade*.html`

## Components Launched

When you run the HTML log-based launch, the following components are started:

### 1. HTML Trade Report Log
- Opens in your default web browser
- Displays your trading history and reports
- Provides visual feedback on past trades

### 2. VPS Trading System
- 24/7 automated trading system
- MetaTrader 5 integration
- Exness terminal connection
- Background trading services

### 3. Trading Bridge
- Python trading engine
- MQL5 integration
- Real-time trade execution
- Risk management system

### 4. GitHub Pages Website
- Live website: https://mouy-leng.github.io/ZOLO-A6-9VxNUNA-/
- Documentation access
- Project overview

### 5. Repository Startup Sequence
- Complete device setup
- Workspace configuration
- Cloud sync services
- Security validation

## Launch Logs

All launch operations are logged to:
```
logs/html-launch-log.txt
```

The log includes:
- Launch timestamps
- Components started
- Any warnings or errors
- HTML log path used
- Success/failure status

## Troubleshooting

### HTML Log Not Found

**Problem**: The HTML log file cannot be found

**Solution**:
1. Verify the path in `html-log-config.txt`
2. Check if the file exists at the specified location
3. Update the path to match your actual file location
4. Use the automatic search feature by placing the file in a supported location

### Script Execution Issues

**Problem**: PowerShell execution policy prevents script from running

**Solution**:
```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
.\launch-from-html-logs.ps1
```

### Components Not Starting

**Problem**: Some systems don't launch

**Solution**:
1. Check the launch log: `logs/html-launch-log.txt`
2. Verify all required scripts exist in the repository
3. Run components individually to identify issues
4. Ensure you have Administrator privileges

## Integration with Startup

### Auto-Launch on Windows Startup

To launch automatically when Windows starts:

1. Create a shortcut to `LAUNCH-FROM-HTML-LOGS.bat`
2. Press `Win + R`, type `shell:startup`, press Enter
3. Move the shortcut to the Startup folder

Or use the setup script:
```powershell
.\setup-auto-startup-admin.ps1
```

### Task Scheduler Integration

Schedule launches at specific times:
```powershell
# Create a scheduled task
schtasks /create /tn "ZOLO-HTML-Launch" /tr "C:\Path\To\LAUNCH-FROM-HTML-LOGS.bat" /sc daily /st 08:00
```

## Files in the System

### Core Launch Files
- `launch-from-html-logs.ps1` - Main PowerShell launch script
- `LAUNCH-FROM-HTML-LOGS.bat` - Batch file for easy double-click launching
- `html-log-config.txt` - Configuration file for HTML log paths

### Related Scripts
- `start-vps-system.ps1` - VPS system launcher
- `setup-and-start-trading-auto.ps1` - Trading system launcher
- `start.ps1` - Main repository startup script

### Logs Directory
- `logs/` - Directory for launch logs
- `logs/html-launch-log.txt` - HTML launch operation log

## Advanced Usage

### Custom Launch Sequence

Create your own custom launch by modifying `launch-from-html-logs.ps1`:

```powershell
# Add your custom startup commands here
# Example: Launch additional applications

# Launch custom application
Start-Process "C:\Path\To\YourApp.exe"

# Run custom script
& "C:\Path\To\YourScript.ps1"
```

### Multiple HTML Logs

If you have multiple HTML log files, create separate launch scripts:

```powershell
# Launch with specific log
.\launch-from-html-logs.ps1 -HtmlLogPath "J:\Reports\Report1.html"

# Launch with another log
.\launch-from-html-logs.ps1 -HtmlLogPath "J:\Reports\Report2.html"
```

## Security Considerations

- HTML log files may contain sensitive trading information
- Ensure log files are stored securely
- The HTML log path is not committed to Git
- Launch logs do not contain sensitive data
- All credentials are managed through Windows Credential Manager

## Best Practices

1. **Keep HTML logs organized**: Store them in a dedicated backup folder
2. **Regular updates**: Update `html-log-config.txt` when moving log files
3. **Monitor launch logs**: Check `logs/html-launch-log.txt` regularly
4. **Test launches**: Test the launch system after updates
5. **Backup configuration**: Keep a backup of your configuration files

## Related Documentation

- [README.md](README.md) - Main repository documentation
- [AUTOMATION-RULES.md](AUTOMATION-RULES.md) - Automation patterns
- [VPS-SETUP-GUIDE.md](VPS-SETUP-GUIDE.md) - VPS trading system guide
- [WORKSPACE-SETUP.md](WORKSPACE-SETUP.md) - Workspace configuration

## Support

For issues or questions:
- Check the launch logs first: `logs/html-launch-log.txt`
- Review the troubleshooting section above
- Open an issue on GitHub: https://github.com/Mouy-leng/ZOLO-A6-9VxNUNA-/issues

## Version History

- **v1.0** (2026-01-05) - Initial release of HTML log-based launch system
  - PowerShell launch script
  - Batch file launcher
  - Configuration file support
  - Automatic HTML log search
  - Launch logging

---

**⚡ Built with passion by A6-9V Organization**
