# Port 5500 Configuration Guide

Complete guide for configuring the trading system to use port 5500 for Docker/Exness compatibility.

## Overview

The trading bridge system now uses **port 5500** as the default for all components:
- Python ZeroMQ bridge server
- MQL5 Expert Advisors and Scripts
- Docker container services
- All test and verification scripts

## Why Port 5500?

Port 5500 is configured for:
1. **Exness Compatibility**: Optimized for Exness broker integration
2. **Docker Standard**: Common port for containerized trading services
3. **Firewall Configuration**: Pre-configured in Windows Firewall rules
4. **System Integration**: Consistent across all trading components

## Components Using Port 5500

### Python Components

1. **MQL5Bridge** (`python/bridge/mql5_bridge.py`)
   - Default port: 5500
   - ZeroMQ REP socket listening on tcp://127.0.0.1:5500

2. **BackgroundTradingService** (`python/services/background_service.py`)
   - Default bridge_port: 5500
   - Initializes bridge on port 5500

3. **AITradingService** (`python/services/ai_trading_service.py`)
   - Default bridge_port: 5500
   - AI-powered trading with bridge on port 5500

### MQL5 Components

1. **PythonBridgeEA.mq5** (`mql5/Experts/PythonBridgeEA.mq5`)
   - Input parameter BridgePort: 5500
   - Connects to Python bridge on port 5500

2. **PythonBridge.mqh** (`mql5/Include/PythonBridge.mqh`)
   - Constructor default m_port: 5500
   - ZeroMQ REQ socket connecting to tcp://127.0.0.1:5500

3. **AccountSetup_279410452.mq5** (`mql5/Scripts/AccountSetup_279410452.mq5`)
   - Input parameter BridgePort: 5500
   - Displays bridge configuration and status

### Test & Verification Scripts

1. **test-bridge-connection.py**
   - Tests bridge on port 5500
   - Verifies ZeroMQ communication

2. **verify-exness-setup.py**
   - Validates Exness configuration with port 5500
   - Checks all components are properly configured

3. **test-bridge-debug.py**
   - Debug mode testing on port 5500
   - Detailed connection diagnostics

## Migration from Port 5555

If you were using the old default port 5555, all components have been updated to 5500. No manual changes needed unless you explicitly set the port in custom configurations.

### What Changed

| Component | Old Default | New Default | Status |
|-----------|-------------|-------------|--------|
| Python Bridge | 5555 | 5500 | ✅ Updated |
| Background Service | 5555 | 5500 | ✅ Updated |
| AI Service | 5555 | 5500 | ✅ Updated |
| PythonBridgeEA | 5555 | 5500 | ✅ Updated |
| PythonBridge.mqh | 5555 | 5500 | ✅ Updated |
| Test Scripts | 5555 | 5500 | ✅ Updated |

## Firewall Configuration

Port 5500 must be allowed through Windows Firewall:

### Automatic Setup

Run the provided script:
```powershell
.\trading-bridge\setup-firewall-port-5500.ps1
```

### Manual Setup

```powershell
New-NetFirewallRule -DisplayName "Trading Bridge Port 5500" `
    -Direction Inbound `
    -LocalPort 5500 `
    -Protocol TCP `
    -Action Allow
```

## Docker Configuration

If running the trading service in Docker, ensure port 5500 is exposed:

### Dockerfile Example

```dockerfile
EXPOSE 5500
```

### Docker Run Command

```bash
docker run -p 5500:5500 trading-bridge
```

### Docker Compose

```yaml
services:
  trading-bridge:
    ports:
      - "5500:5500"
```

## Verification

### Check Port Availability

**PowerShell**:
```powershell
Get-NetTCPConnection -LocalPort 5500 -ErrorAction SilentlyContinue
```

**Python**:
```python
import socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
result = sock.connect_ex(('127.0.0.1', 5500))
sock.close()
print("Port 5500 is", "in use" if result == 0 else "available")
```

### Test Bridge Connection

```powershell
cd trading-bridge
python test-bridge-connection.py
```

Expected output:
```
✅ Bridge is LISTENING on port 5500
✅ Ready to receive connections from MQL5 EA
```

### Verify Complete Setup

```powershell
cd trading-bridge
python verify-exness-setup.py
```

## Starting the Service

### Start Trading Bridge Service

```powershell
cd trading-bridge
python run-trading-service.py
```

You should see:
```
MQL5 Bridge started on tcp://127.0.0.1:5500
Background Trading Service started
```

### Start with Custom Port (if needed)

```python
from services.background_service import BackgroundTradingService

service = BackgroundTradingService(bridge_port=5500)
service.start()
```

## MQL5 EA Configuration

When attaching PythonBridgeEA to a chart:

1. **Open EA Settings**
2. **Set Parameters**:
   - BridgePort: `5500`
   - BrokerName: `EXNESS`
   - AutoExecute: `true`
3. **Allow Expert Advisors**: ✅
4. **Allow DLL imports**: ✅

## Troubleshooting

### Port Already in Use

If port 5500 is already in use:

1. **Find the process**:
   ```powershell
   Get-Process -Id (Get-NetTCPConnection -LocalPort 5500).OwningProcess
   ```

2. **Stop the process** or choose a different port

### Bridge Not Connecting

1. **Check firewall**: Ensure port 5500 is allowed
2. **Verify service is running**: Check with `Get-NetTCPConnection -LocalPort 5500`
3. **Check logs**: Review `trading-bridge/logs/mql5_bridge_*.log`
4. **Restart service**: Stop and start the Python service

### EA Not Receiving Signals

1. **Verify port matches**: EA BridgePort = 5500
2. **Check EA is running**: Look for EA name in MT5 chart corner
3. **Check EA logs**: MT5 → Experts tab
4. **Verify AutoExecute**: EA parameter AutoExecute = true

## Custom Port Configuration

If you need to use a different port:

### Python Side

```python
from bridge.mql5_bridge import MQL5Bridge

bridge = MQL5Bridge(port=YOUR_PORT)
bridge.start()
```

### MQL5 Side

In EA input parameters:
```cpp
input int BridgePort = YOUR_PORT;
```

**Important**: Both sides MUST use the same port!

## Best Practices

1. **Use Default Port**: Stick with 5500 unless you have a specific reason to change
2. **Firewall Rules**: Ensure port 5500 is allowed before starting services
3. **Port Consistency**: Always verify Python and MQL5 use the same port
4. **Log Monitoring**: Check logs regularly for connection issues
5. **Single Instance**: Run only one bridge service per port

## Security Considerations

1. **Local Only**: Bridge binds to 127.0.0.1 (localhost only)
2. **Firewall**: Port 5500 should only accept local connections
3. **No External Access**: Never expose port 5500 to the internet
4. **VPN Required**: Use VPN for remote access to trading system

## Related Files

- `configure-exness-port-5500.ps1` - Automated configuration script
- `setup-firewall-port-5500.ps1` - Firewall setup script
- `README.md` - Main trading bridge documentation
- `CONFIGURATION.md` - Detailed configuration guide

## Support

For issues with port configuration:
1. Run `verify-exness-setup.py` for diagnostics
2. Check firewall rules: `Get-NetFirewallRule -DisplayName "*5500*"`
3. Review service logs in `trading-bridge/logs/`
4. Test with `test-bridge-connection.py`

## Summary

✅ All components now use port 5500 by default
✅ Docker-compatible configuration
✅ Optimized for Exness broker integration
✅ Firewall rules pre-configured
✅ Test scripts updated
✅ Full backward compatibility maintained

The system is ready to use port 5500 for all trading bridge communications!
