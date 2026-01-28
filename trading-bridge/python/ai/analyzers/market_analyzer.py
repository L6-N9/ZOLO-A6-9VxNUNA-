"""
AI Market Analyzer
Comprehensive market analysis using AI and technical indicators
"""
import logging
from typing import Dict, Optional, Any
from datetime import datetime, timedelta
import pandas as pd
import numpy as np

logger = logging.getLogger(__name__)

class AIMarketAnalyzer:
    """
    AI-powered market analysis
    Analyzes market conditions using technical indicators and AI
    """
    
    def __init__(self):
        """Initialize market analyzer"""
        self.indicators_enabled = False
        self._check_dependencies()
        self.timeframe_map = {
            'M1': '1m', 'M5': '5m', 'M15': '15m', 'M30': '30m',
            'H1': '1h', 'H4': '1h', 'D1': '1d',
            '5m': '5m', '15m': '15m', '30m': '30m', '1h': '1h'
        }
    
    def _check_dependencies(self):
        """Check if required libraries are available"""
        try:
            # Try to import pandas-ta (optional)
            try:
                import pandas_ta as ta
                import yfinance as yf
                self.indicators_enabled = True
                logger.info("Technical indicators and data fetching enabled (pandas-ta, yfinance)")
            except ImportError as e:
                logger.warning(f"Optional libraries not available: {e} - using basic indicators")
                self.indicators_enabled = False
        except ImportError:
            logger.warning("Required libraries not available - limited functionality")
            self.indicators_enabled = False
    
    def analyze(self, symbol: str, timeframe: str = "H1") -> Dict:
        """
        Perform comprehensive market analysis
        
        Args:
            symbol: Trading symbol (e.g., 'EURUSD')
            timeframe: Timeframe (e.g., 'H1', 'H4', 'D1')
            
        Returns:
            Analysis dictionary
        """
        try:
            # Get market data
            market_data = self._get_market_data(symbol, timeframe)
            
            if not market_data or 'df' not in market_data or market_data['df'].empty:
                logger.warning(f"No market data available for {symbol}")
                return {
                    'symbol': symbol,
                    'timeframe': timeframe,
                    'timestamp': datetime.now().isoformat(),
                    'sentiment': 'neutral',
                    'trend': {'direction': 'unknown', 'strength': 0.0},
                    'volatility': 0.0,
                    'indicators': {},
                    'confidence': 0.0,
                    'error': 'No market data available'
                }
            
            # Calculate technical indicators
            indicators = self._calculate_indicators(market_data)
            market_data['indicators'] = indicators

            # Analyze sentiment
            sentiment = self._analyze_sentiment(market_data)
            
            # Analyze trend
            trend = self._analyze_trend(market_data)
            
            # Analyze volatility
            volatility = self._analyze_volatility(market_data)
            
            # Calculate confidence
            confidence = self._calculate_confidence(sentiment, trend, volatility, indicators)
            
            return {
                'symbol': symbol,
                'timeframe': timeframe,
                'timestamp': datetime.now().isoformat(),
                'sentiment': sentiment,
                'trend': trend,
                'volatility': volatility,
                'indicators': indicators,
                'confidence': confidence,
                'close_price': market_data['df']['Close'].iloc[-1]
            }
            
        except Exception as e:
            logger.error(f"Error in market analysis: {e}")
            import traceback
            logger.error(traceback.format_exc())
            return {
                'symbol': symbol,
                'timeframe': timeframe,
                'timestamp': datetime.now().isoformat(),
                'sentiment': 'neutral',
                'trend': {'direction': 'unknown', 'strength': 0.0},
                'volatility': 0.0,
                'indicators': {},
                'confidence': 0.0,
                'error': str(e)
            }
    
    def _map_symbol(self, symbol: str) -> str:
        """Map generic symbol to yfinance format"""
        if '=' in symbol or '-' in symbol:
            return symbol
            
        if '/' in symbol:
            symbol = symbol.replace('/', '')
            
        # Forex
        if len(symbol) == 6 and symbol.isalpha() and not symbol.endswith('USD'): # crude check
             return f"{symbol}=X"
        if len(symbol) == 6 and symbol.isalpha() and symbol.endswith('USD'): # likely forex like EURUSD
             return f"{symbol}=X"
        # Crypto
        if symbol.endswith('USD') and len(symbol) > 6: # e.g. BTCUSD -> BTC-USD
             return f"{symbol[:-3]}-USD"

        # Default fallback for major forex pairs if they come in clean
        forex_pairs = ['EURUSD', 'GBPUSD', 'USDJPY', 'AUDUSD', 'USDCAD', 'USDCHF', 'NZDUSD']
        if symbol in forex_pairs:
            return f"{symbol}=X"
            
        return symbol

    def _get_market_data(self, symbol: str, timeframe: str) -> Optional[Dict]:
        """Get market data from yfinance"""
        if not self.indicators_enabled:
            return {'symbol': symbol, 'timeframe': timeframe, 'df': pd.DataFrame()}

        try:
            import yfinance as yf
            
            yf_symbol = self._map_symbol(symbol)
            yf_interval = self.timeframe_map.get(timeframe, '1h')

            # Fetch data
            period = "5d"
            if yf_interval in ['1m', '5m', '15m']:
                period = "1d" # shorter period for granular data to be faster
            elif yf_interval in ['30m', '1h']:
                period = "5d"

            ticker = yf.Ticker(yf_symbol)
            df = ticker.history(period=period, interval=yf_interval)

            if df.empty:
                logger.warning(f"Empty data for {yf_symbol}")
                return None

            return {
                'symbol': symbol,
                'yf_symbol': yf_symbol,
                'timeframe': timeframe,
                'df': df
            }
        except Exception as e:
            logger.error(f"Error fetching data for {symbol}: {e}")
            return None
    
    def _calculate_indicators(self, market_data: Dict) -> Dict:
        """Calculate technical indicators using pandas-ta"""
        indicators = {}
        if not self.indicators_enabled or 'df' not in market_data:
            return indicators

        df = market_data['df']
        try:
            import pandas_ta as ta

            # RSI
            df.ta.rsi(length=14, append=True)
            if 'RSI_14' in df.columns:
                indicators['RSI'] = df['RSI_14'].iloc[-1]

            # MACD
            df.ta.macd(append=True)
            if 'MACD_12_26_9' in df.columns:
                indicators['MACD'] = {
                    'macd': df['MACD_12_26_9'].iloc[-1],
                    'signal': df['MACDs_12_26_9'].iloc[-1],
                    'hist': df['MACDh_12_26_9'].iloc[-1]
                }

            # Bollinger Bands
            df.ta.bbands(length=20, std=2, append=True)
            if 'BBL_20_2.0' in df.columns:
                 indicators['BB'] = {
                     'upper': df['BBU_20_2.0'].iloc[-1],
                     'middle': df['BBM_20_2.0'].iloc[-1],
                     'lower': df['BBL_20_2.0'].iloc[-1]
                 }

            # Stochastic
            df.ta.stoch(append=True)
            if 'STOCHk_14_3_3' in df.columns:
                indicators['STOCH'] = {
                    'k': df['STOCHk_14_3_3'].iloc[-1],
                    'd': df['STOCHd_14_3_3'].iloc[-1]
                }

            # EMA
            df.ta.ema(length=50, append=True)
            df.ta.ema(length=200, append=True)
            if 'EMA_50' in df.columns:
                indicators['EMA_50'] = df['EMA_50'].iloc[-1]
            if 'EMA_200' in df.columns:
                indicators['EMA_200'] = df['EMA_200'].iloc[-1]

        except Exception as e:
            logger.error(f"Error calculating indicators: {e}")

        return indicators
    
    def _analyze_sentiment(self, market_data: Dict) -> str:
        """Analyze market sentiment"""
        indicators = market_data.get('indicators', {})
        score = 0
        
        # RSI
        if 'RSI' in indicators:
            rsi = indicators['RSI']
            if rsi > 50: score += 1
            else: score -= 1
            
        # MACD
        if 'MACD' in indicators:
            hist = indicators['MACD'].get('hist', 0)
            if hist > 0: score += 1
            else: score -= 1

        # EMA
        if 'EMA_50' in indicators and 'EMA_200' in indicators:
            if indicators['EMA_50'] > indicators['EMA_200']: score += 1
            else: score -= 1

        if score > 0: return 'bullish'
        if score < 0: return 'bearish'
        return 'neutral'

    def _analyze_trend(self, market_data: Dict) -> Dict:
        """Analyze market trend"""
        indicators = market_data.get('indicators', {})
        direction = 'sideways'
        strength = 0.5
        
        if 'EMA_50' in indicators and 'EMA_200' in indicators:
            ema50 = indicators['EMA_50']
            ema200 = indicators['EMA_200']
            if ema50 > ema200:
                direction = 'up'
                strength = 0.7
            else:
                direction = 'down'
                strength = 0.7

        return {'direction': direction, 'strength': strength}

    def _analyze_volatility(self, market_data: Dict) -> float:
        """Analyze market volatility"""
        indicators = market_data.get('indicators', {})
        if 'BB' in indicators:
            upper = indicators['BB']['upper']
            lower = indicators['BB']['lower']
            middle = indicators['BB']['middle']
            if middle > 0:
                bandwidth = (upper - lower) / middle
                # Normalize somewhat arbitrarily
                return min(bandwidth * 10, 1.0)
        return 0.5

    def _calculate_confidence(self, sentiment: str, trend: Dict, volatility: float, indicators: Dict) -> float:
        """Calculate confidence"""
        confidence = 0.5
        
        # Trend agreement
        if (sentiment == 'bullish' and trend['direction'] == 'up') or \
           (sentiment == 'bearish' and trend['direction'] == 'down'):
            confidence += 0.2

        # Technical confirmation
        if 'RSI' in indicators:
            rsi = indicators['RSI']
            if sentiment == 'bullish' and 40 < rsi < 70:
                confidence += 0.1
            elif sentiment == 'bearish' and 30 < rsi < 60:
                confidence += 0.1

        return min(max(confidence, 0.0), 1.0)
