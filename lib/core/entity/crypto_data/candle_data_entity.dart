import 'package:cryptovisor/core/helpers/crypto_visor_format_number_helper.dart';
import 'package:flutter/material.dart';

class CandleDataEntity {
  final double open;
  final double high;
  final double low;
  final double close;
  final DateTime timestamp;

  const CandleDataEntity({
    required this.low,
    required this.high,
    required this.close,
    required this.open,
    required this.timestamp,
  });

  bool get isGain => close >= open;

  Color get colorCandle => isGain ? Colors.green : Colors.redAccent;

  factory CandleDataEntity.fromMap(Map<String, dynamic> map) {
    return CandleDataEntity(
        close: CryptoVisorFormatNumberHelper.formatNumber(map["close"] ?? 0.0),
        open: CryptoVisorFormatNumberHelper.formatNumber(map["open"] ?? 0.0),
        low: CryptoVisorFormatNumberHelper.formatNumber(map["low"] ?? 0.0),
        high: CryptoVisorFormatNumberHelper.formatNumber(map["high"] ?? 0.0),
        timestamp: DateTime.parse(map["date"] ?? DateTime.now()));
  }
}
