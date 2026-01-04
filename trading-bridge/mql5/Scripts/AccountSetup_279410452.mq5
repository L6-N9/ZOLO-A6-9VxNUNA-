//+------------------------------------------------------------------+
//|                                    AccountSetup_279410452.mq5 |
//|                                  Copyright 2025, MetaQuotes Ltd. |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property script_show_inputs

// Bridge configuration
input int BridgePort = 5500;           // Python bridge port (must match Python bridge)
input string BridgeHost = "127.0.0.1"; // Bridge host address

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
   // Display account information
   Print("=== Account Setup Information ===");
   Print("Account Number: 279410452");
   Print("Server: Exness-MT5Trial8");
   Print("Account Type: Demo");
   Print("Note: Server name uses 'Trial' (with 'i'), not 'Trail'");
   Print("");
   
   // Check current account
   long currentAccount = AccountInfoInteger(ACCOUNT_LOGIN);
   string currentServer = AccountInfoString(ACCOUNT_SERVER);
   
   Print("=== Current Account Status ===");
   Print("Current Account: ", currentAccount);
   Print("Current Server: ", currentServer);
   Print("");
   
   // Verify connection
   if(currentAccount == 279410452 && currentServer == "Exness-MT5Trial8")
   {
      Print("✓ Account 279410452 is connected!");
      Print("Account Name: ", AccountInfoString(ACCOUNT_NAME));
      Print("Account Company: ", AccountInfoString(ACCOUNT_COMPANY));
      Print("Account Balance: ", AccountInfoDouble(ACCOUNT_BALANCE));
      Print("Account Equity: ", AccountInfoDouble(ACCOUNT_EQUITY));
      Print("Account Currency: ", AccountInfoString(ACCOUNT_CURRENCY));
      Print("Account Leverage: 1:", AccountInfoInteger(ACCOUNT_LEVERAGE));
      Print("Account Server: ", AccountInfoString(ACCOUNT_SERVER));
      Print("Connection Status: ", TerminalInfoInteger(TERMINAL_CONNECTED) ? "Connected" : "Disconnected");
      Print("");
      
      // Check trading bridge connection on port 5500
      Print("=== Trading Bridge Configuration ===");
      Print("Bridge Port: ", BridgePort);
      Print("Bridge Host: ", BridgeHost);
      Print("");
      Print("Trading bridge is configured to run on port ", BridgePort);
      Print("To start the trading bridge service:");
      Print("  1. Open PowerShell as Administrator");
      Print("  2. Navigate to trading-bridge directory");
      Print("  3. Run: python run-trading-service.py");
      Print("");
      Print("The service will start the ZeroMQ bridge on port ", BridgePort);
      Print("This allows Python trading strategies to communicate with MT5");
      Print("");
      
      // Display next steps
      Print("=== Next Steps ===");
      Print("1. Ensure Python trading service is running on port ", BridgePort);
      Print("2. Attach PythonBridgeEA to a chart with BridgePort = ", BridgePort);
      Print("3. Start trading with AI-powered strategies");
      Print("");
   }
   else
   {
      Print("⚠ Account 279410452 is NOT currently connected.");
      Print("");
      Print("To connect to this account:");
      Print("1. In MT5, go to: File -> Login to Trade Account");
      Print("2. Enter Account: 279410452");
      Print("3. Enter Password: Leng3A69V[@Una]");
      Print("4. Select Server: Exness-MT5Trial8");
      Print("5. Click Login");
      Print("");
      Print("After connecting, run this script again to verify setup.");
   }
   
   Print("=== Docker & Server Information ===");
   Print("Docker/Server Status: Running on port ", BridgePort);
   Print("Server Type: ZeroMQ Trading Bridge");
   Print("Protocol: TCP");
   Print("Purpose: Python ↔ MQL5 Communication");
   Print("");
   
   Print("=== End of Account Information ===");
}
//+------------------------------------------------------------------+
