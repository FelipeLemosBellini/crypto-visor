import 'package:cryptovisor/core/entity/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/crypto_data/bollinger_bands_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/moving_average_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/relative_strength_index_model.dart';

class DataAssetState {
  bool showBollinger = false;
  bool showMovingAverage14 = false;
  List<RelativeStrengthIndexModel> rsi = [];
  List<BollingerBandsModel> bollinger = [];
  List<MovingAverageOfModel> movingAverage14 = [];

  List<CandleDataEntity> candles = [];

  DataAssetState copyWith({
    List<RelativeStrengthIndexModel>? rsi,
    List<BollingerBandsModel>? bollinger,
    List<CandleDataEntity>? candles,
    List<MovingAverageOfModel>? movingAverage14,
    bool? showBollinger,
    bool? showMovingAverage14,
  }) {
    return DataAssetState()
      ..showBollinger = showBollinger ?? this.showBollinger
      ..showMovingAverage14 = showMovingAverage14 ?? this.showMovingAverage14
      ..rsi = rsi ?? this.rsi
      ..movingAverage14 = movingAverage14 ?? this.movingAverage14
      ..bollinger = bollinger ?? this.bollinger
      ..candles = candles ?? this.candles;
  }
}
