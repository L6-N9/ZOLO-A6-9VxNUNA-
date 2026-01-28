"""
Scalping Strategy
Small time scalping strategy (5mn, 15mn, 30mn)
"""
from typing import Dict, Optional
import logging
from .base_strategy import BaseStrategy

logger = logging.getLogger(__name__)


class ScalpingStrategy(BaseStrategy):
    """
    Scalping strategy for 5m, 15m, 30m timeframes
    Uses RSI, Stochastic and Bollinger Bands for mean reversion scalping
    """

    def __init__(self, config: Optional[Dict] = None):
        """
        Initialize scalping strategy

        Args:
            config: Strategy configuration
        """
        super().__init__("Scalping Strategy", config)
        self.indicators = ['RSI', 'STOCH', 'BB']
        self.scalping_timeframes = ['5m', '15m', '30m', 'M5', 'M15', 'M30']

    def generate_signal(self, symbol: str, market_data: Dict) -> Optional[Dict]:
        """
        Generate trading signal using scalping logic

        Args:
            symbol: Trading symbol
            market_data: Market data and analysis

        Returns:
            Trading signal dictionary
        """
        try:
            # Check timeframe
            timeframe = market_data.get('timeframe')
            if timeframe not in self.scalping_timeframes:
                return None

            indicators = market_data.get('indicators', {})
            close_price = market_data.get('close_price')

            signal_action = 'HOLD'
            confidence = 0.0
            reasoning_parts = []

            # 1. RSI Check
            rsi = indicators.get('RSI')
            rsi_signal = 0 # -1 sell, 1 buy
            if rsi is not None:
                if rsi < 30:
                    rsi_signal = 1
                    reasoning_parts.append(f'RSI oversold ({rsi:.1f})')
                    confidence += 0.3
                elif rsi > 70:
                    rsi_signal = -1
                    reasoning_parts.append(f'RSI overbought ({rsi:.1f})')
                    confidence += 0.3

            # 2. Stochastic Check
            stoch = indicators.get('STOCH')
            stoch_signal = 0
            if stoch:
                k = stoch.get('k')
                d = stoch.get('d')
                if k is not None:
                    if k < 20:
                        stoch_signal = 1
                        reasoning_parts.append(f'Stoch oversold (K={k:.1f})')
                        confidence += 0.2
                    elif k > 80:
                        stoch_signal = -1
                        reasoning_parts.append(f'Stoch overbought (K={k:.1f})')
                        confidence += 0.2

            # 3. Bollinger Bands Check
            bb = indicators.get('BB')
            bb_signal = 0
            if bb and close_price:
                lower = bb.get('lower')
                upper = bb.get('upper')
                if lower and close_price <= lower * 1.0005: # Near or below lower band
                    bb_signal = 1
                    reasoning_parts.append('Price at lower BB')
                    confidence += 0.2
                elif upper and close_price >= upper * 0.9995: # Near or above upper band
                    bb_signal = -1
                    reasoning_parts.append('Price at upper BB')
                    confidence += 0.2

            # Combine Signals
            # Require at least RSI or Stoch extreme + some confirmation

            total_score = rsi_signal + stoch_signal + bb_signal

            if total_score >= 2: # At least 2 indicators agree on Buy
                signal_action = 'BUY'
                # Boost confidence if all agree
                if total_score == 3: confidence += 0.2
            elif total_score <= -2: # At least 2 indicators agree on Sell
                signal_action = 'SELL'
                if total_score == -3: confidence += 0.2

            # Special case: Strong RSI extreme
            if rsi is not None:
                if rsi < 20 and signal_action != 'SELL':
                    signal_action = 'BUY'
                    confidence = max(confidence, 0.7)
                    reasoning_parts.append('Extreme RSI oversold')
                elif rsi > 80 and signal_action != 'BUY':
                    signal_action = 'SELL'
                    confidence = max(confidence, 0.7)
                    reasoning_parts.append('Extreme RSI overbought')

            if signal_action != 'HOLD' and confidence >= 0.5:
                signal = {
                    'action': signal_action,
                    'symbol': symbol,
                    'confidence': min(confidence, 1.0),
                    'reasoning': f"Scalping ({timeframe}): " + '; '.join(reasoning_parts),
                    'strategy': self.name,
                    'timeframe': timeframe,
                    'indicators': {
                        'RSI': rsi,
                        'Stoch_K': stoch.get('k') if stoch else None,
                        'BB_Lower': bb.get('lower') if bb else None,
                        'BB_Upper': bb.get('upper') if bb else None,
                        'Close': close_price
                    }
                }

                if self.validate_signal(signal):
                    return signal

            return None

        except Exception as e:
            logger.error(f"Error generating scalping signal: {e}")
            return None

    def get_required_indicators(self) -> list:
        """Get required indicators"""
        return self.indicators
