import 'package:cryptovisor/core/entity/crypto_data/exponential_moving_average_of_days.dart';
import 'package:cryptovisor/core/entity/crypto_data/relative_strength_index_model.dart';

class DataAssetState {
  List<RelativeStrengthIndexModel> rsi = [
    RelativeStrengthIndexModel(value: 100, date: DateTime.now()),
    RelativeStrengthIndexModel(value: 50, date: DateTime.now()),
    RelativeStrengthIndexModel(value: 80, date: DateTime.now()),
    RelativeStrengthIndexModel(value: 75, date: DateTime.now()),
    RelativeStrengthIndexModel(value: 65, date: DateTime.now()),
    RelativeStrengthIndexModel(value: 68, date: DateTime.now()),
    RelativeStrengthIndexModel(value: 63, date: DateTime.now()),
    RelativeStrengthIndexModel(value: 41, date: DateTime.now()),
    RelativeStrengthIndexModel(value: 43, date: DateTime.now()),
  ];

  DataAssetState copyWith({
    List<RelativeStrengthIndexModel>? rsi,
  }) {
    return DataAssetState()..rsi = rsi ?? this.rsi;
  }
}
