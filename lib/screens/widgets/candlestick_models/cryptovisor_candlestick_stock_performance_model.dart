import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';

class FoxbitBankStockTimeFramePerformanceModel {
  List<CandleDataEntity> data;
  late double _open;
  late double _close;
  late double _high;
  late double _low;

  FoxbitBankStockTimeFramePerformanceModel({required this.data}) : assert(data.isNotEmpty) {
    _open = data.first.open;
    _close = data.last.close;
    _high = data.first.high;
    _low = data.first.low;

    for (CandleDataEntity candlestick in data) {
      if (candlestick.high > _high) _high = candlestick.high;
      if (candlestick.low < _low) _low = candlestick.low;
    }
  }

  double get open => _open;

  double get close => _close;

  double get high => _high;

  double get low => _low;

  double get dollarChange => _close - _open;

  double get percentageChange => (dollarChange / _open) * 100;
}
