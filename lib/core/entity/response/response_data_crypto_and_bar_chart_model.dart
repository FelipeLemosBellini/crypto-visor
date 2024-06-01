import 'package:cryptovisor/core/entity/crypto_data/bollinger_bands_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/moving_average_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/relative_strength_index_model.dart';

class ResponseDataCryptoAndBarChartModel {
  final double lastCloseValue;
  final List<RelativeStrengthIndexModel> relativeStrengthIndex;
  final List<MovingAverageOfModel> exponentialMovingAverageOf8days;
  final List<MovingAverageOfModel> exponentialMovingAverageOf14days;
  final List<MovingAverageOfModel> exponentialMovingAverageOf30days;
  final List<BollingerBandsModel> bollingerBands;

  ResponseDataCryptoAndBarChartModel({
    required this.lastCloseValue,
    required this.relativeStrengthIndex,
    required this.exponentialMovingAverageOf8days,
    required this.exponentialMovingAverageOf14days,
    required this.exponentialMovingAverageOf30days,
    required this.bollingerBands,
  });

  ResponseDataCryptoAndBarChartModel criarObjeto() {
    return ResponseDataCryptoAndBarChartModel(
      bollingerBands: [],
      exponentialMovingAverageOf8days: [],
      exponentialMovingAverageOf14days: [],
      exponentialMovingAverageOf30days: [],
      relativeStrengthIndex: [],
      lastCloseValue: 0.0,
    );
  }

  factory ResponseDataCryptoAndBarChartModel.fromMap(Map<String, dynamic> map) {
    List<RelativeStrengthIndexModel> rsiModel = [];
    List<MovingAverageOfModel> listEmaModel8Days = [];
    List<MovingAverageOfModel> listEmaModel14Days = [];
    List<MovingAverageOfModel> listEmaModel30Days = [];
    List<BollingerBandsModel> listBollingerModel = [];

    map['relativeStrengthIndex'].map((element) => rsiModel.add(RelativeStrengthIndexModel.fromMap(element))).toList();
    map['exponentialMovingAverageOf8days']
        .map((element) => listEmaModel8Days.add(MovingAverageOfModel.fromMap(element)))
        .toList();
    map['exponentialMovingAverageOf14days']
        .map((element) => listEmaModel14Days.add(MovingAverageOfModel.fromMap(element)))
        .toList();
    map['exponentialMovingAverageOf30days']
        .map((element) => listEmaModel30Days.add(MovingAverageOfModel.fromMap(element)))
        .toList();
    map['bollingerBands'].map((element) => listBollingerModel.add(BollingerBandsModel.fromMap(element))).toList();

    return ResponseDataCryptoAndBarChartModel(
        lastCloseValue: double.tryParse(map['lastCloseValue'].toString()) ?? 0.0,
        relativeStrengthIndex: rsiModel,
        exponentialMovingAverageOf8days: listEmaModel8Days,
        exponentialMovingAverageOf14days: listEmaModel14Days,
        exponentialMovingAverageOf30days: listEmaModel30Days,
        bollingerBands: listBollingerModel);
  }
}
