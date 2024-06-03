import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/crypto_data/bollinger_bands_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/moving_average_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/relative_strength_index_model.dart';

class DataAssetState {
  bool showBollinger = false;
  bool showMovingAverage8 = false;
  bool showMovingAverage14 = false;
  bool showMovingAverage30 = false;
  List<RelativeStrengthIndexModel> rsi = [];
  List<BollingerBandsModel> bollinger = [];
  List<MovingAverageOfModel> movingAverage8 = [];
  List<MovingAverageOfModel> movingAverage14 = [];
  List<MovingAverageOfModel> movingAverage30 = [];
  String quotationValue = "";

  List<CandleDataEntity> candles = [];

  DataAssetState copyWith({
    List<RelativeStrengthIndexModel>? rsi,
    List<BollingerBandsModel>? bollinger,
    List<CandleDataEntity>? candles,
    List<MovingAverageOfModel>? movingAverage8,
    List<MovingAverageOfModel>? movingAverage14,
    List<MovingAverageOfModel>? movingAverage30,
    bool? showBollinger,
    bool? showMovingAverage8,
    bool? showMovingAverage14,
    bool? showMovingAverage30,
    String? quotationValue,
  }) {
    return DataAssetState()
      ..showBollinger = showBollinger ?? this.showBollinger
      ..showMovingAverage8 = showMovingAverage8 ?? this.showMovingAverage8
      ..showMovingAverage14 = showMovingAverage14 ?? this.showMovingAverage14
      ..showMovingAverage30 = showMovingAverage30 ?? this.showMovingAverage30
      ..rsi = rsi ?? this.rsi
      ..movingAverage8 = movingAverage8 ?? this.movingAverage8
      ..movingAverage14 = movingAverage14 ?? this.movingAverage14
      ..movingAverage30 = movingAverage30 ?? this.movingAverage30
      ..bollinger = bollinger ?? this.bollinger
      ..quotationValue = quotationValue ?? this.quotationValue
      ..candles = candles ?? this.candles;
  }
}
