import 'package:cryptovisor/core/entity/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/crypto_data/bollinger_bands_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/exponential_moving_average_of_days.dart';
import 'package:cryptovisor/core/entity/crypto_data/relative_strength_index_model.dart';

class DataAssetState {
  bool showBollinger = false;
  List<RelativeStrengthIndexModel> rsi = [];
  List<BollingerBandsModel> bollinger = [];

  List<CandleDataEntity> candles = [];

  DataAssetState copyWith({
    List<RelativeStrengthIndexModel>? rsi,
    List<BollingerBandsModel>? bollinger,
    List<CandleDataEntity>? candles,
    bool? showBollinger,
  }) {
    return DataAssetState()
      ..showBollinger = showBollinger ?? this.showBollinger
      ..rsi = rsi ?? this.rsi
      ..bollinger = bollinger ?? this.bollinger
      ..candles = candles ?? this.candles;
  }
}
