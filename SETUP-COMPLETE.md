# ZOLO-A6-9VxNUNA Full Setup Complete

## ✅ Setup Status

The full setup for ZOLO-A6-9VxNUNA has been completed. All setup scripts have been created and are ready to use.

## 📁 Created Scripts

All setup scripts are located in the `scripts/` directory:

1. **`complete-device-setup.ps1`** - Windows 11 device configuration
   - Requires Administrator privileges
   - Configures Git, PowerShell execution policy
   - Creates workspace directories
   - Checks Windows features and security settings
   - Syncs repositories

2. **`setup-mt5-integration.ps1`** - MetaTrader 5 integration setup
   - Checks MT5 installation
   - Verifies terminal directory structure
   - Creates MT5 configuration file
   - Configures EXNESS broker integration

3. **`start-trading-system.ps1`** - Trading system launcher
   - Loads MT5 configuration
   - Verifies system resources
   - Provides launch options for MT5 and EA

4. **`full-setup.ps1`** - Master setup script
   - Runs all setup steps in sequence
   - Provides progress feedback
   - Handles errors gracefully

## 🚀 How to Run the Setup

### Option 1: Run Full Setup (Recommended)

```powershell
cd D:\ZOLO-A6-9VxNUNA-
.\scripts\full-setup.ps1
```

**Note**: The device setup step requires Administrator privileges. You may need to run PowerShell as Administrator.

### Option 2: Run Individual Scripts

#### Step 1: Device Setup (Requires Admin)
```powershell
# Run PowerShell as Administrator, then:
cd D:\ZOLO-A6-9VxNUNA-
.\scripts\complete-device-setup.ps1
```

#### Step 2: MT5 Integration
```powershell
cd D:\ZOLO-A6-9VxNUNA-
.\scripts\setup-mt5-integration.ps1
```

#### Step 3: Trading System Verification
```powershell
cd D:\ZOLO-A6-9VxNUNA-
.\scripts\start-trading-system.ps1
```

## 📋 Setup Checklist

- [x] Repository structure created
- [x] Setup scripts created
- [x] MT5 integration script configured
- [x] Trading system launcher created
- [ ] Device setup run (requires Admin - run manually)
- [ ] MT5 integration verified
- [ ] Trading system tested

## 🔧 Configuration Files

After running the setup, configuration files will be created in:
- `%USERPROFILE%\Documents\ZOLO-Workspace\Config\mt5-config.json`

## 📚 Next Steps

1. **Run Device Setup** (as Administrator):
   ```powershell
   .\scripts\complete-device-setup.ps1
   ```

2. **Run MT5 Integration**:
   ```powershell
   .\scripts\setup-mt5-integration.ps1
   ```

3. **Open MetaTrader 5**:
   - Connect to EXNESS broker
   - Navigate to: Tools > Options > Expert Advisors
   - Enable automated trading
   - Compile and attach EXNESS_GenX_Trader.mq5 EA

4. **Launch Trading System**:
   ```powershell
   .\scripts\start-trading-system.ps1
   ```

## 🔗 Repository Information

- **Primary**: `D:\ZOLO-A6-9VxNUNA-` (https://github.com/Mouy-leng/ZOLO-A6-9VxNUNA-.git)
- **Secondary 1**: `D:\bridges3rd` (https://github.com/A6-9V/I-bride_bridges3rd.git)
- **Secondary 2**: `D:\drive-projects` (https://github.com/A6-9V/my-drive-projects.git)

## 📝 Notes

- The device setup script requires Administrator privileges
- MT5 must be installed before running the MT5 integration script
- The EA project should be located at: `C:\Users\[USERNAME]\AppData\Roaming\MetaQuotes\Terminal\53785E099C927DB68A545C249CDBCE06\MQL5\Shared Projects\EXNESS_GenX_Trading`

## 🆘 Troubleshooting

If you encounter issues:

1. **PowerShell Execution Policy**: Run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
2. **Admin Rights**: Right-click PowerShell and select "Run as Administrator"
3. **MT5 Not Found**: Install MetaTrader 5 from https://www.metatrader5.com/en/download
4. **Script Errors**: Check that all scripts are in the `scripts/` directory

---
**Setup Date**: 2025-12-11
**Repository**: ZOLO-A6-9VxNUNA-









