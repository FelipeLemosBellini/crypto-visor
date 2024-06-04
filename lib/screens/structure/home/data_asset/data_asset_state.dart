import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/crypto_data/bollinger_bands_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/moving_average_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/relative_strength_index_model.dart';

class DataAssetState {
  bool showBollinger = false;
  bool showMovingAverage8 = false;
  bool showMovingAverage14 = false;
  bool showMovingAverage30 = false;

  List<int> timers = [7, 30, 60];
  int selectedValue = 30;
  int amountCandles = 180;

  DataAssetState copyWith({
    bool? showBollinger,
    bool? showMovingAverage8,
    bool? showMovingAverage14,
    bool? showMovingAverage30,
    int? selectedValue,
    int? amountCandles,
  }) {
    return DataAssetState()
      ..amountCandles = amountCandles ?? this.amountCandles
      ..selectedValue = selectedValue ?? this.selectedValue
      ..showBollinger = showBollinger ?? this.showBollinger
      ..showMovingAverage8 = showMovingAverage8 ?? this.showMovingAverage8
      ..showMovingAverage14 = showMovingAverage14 ?? this.showMovingAverage14
      ..showMovingAverage30 = showMovingAverage30 ?? this.showMovingAverage30;
  }
}
