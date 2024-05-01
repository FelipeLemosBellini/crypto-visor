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

  factory CandleDataEntity.fromMap(Map<String, dynamic> map) {
    return CandleDataEntity(
        close: double.tryParse(map["closePrice"]) ?? 0.0,
        open: double.tryParse(map["openPrice"]) ?? 0.0,
        low: double.tryParse(map["lowestPrice"]) ?? 0.0,
        high: double.tryParse(map["highestPrice"]) ?? 0.0,
        timestamp: DateTime.parse(map["timestamp"]));
  }
}
