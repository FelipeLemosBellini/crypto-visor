import 'package:cryptovisor/core/entity/crypto_data/bollinger_bands_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/exponential_moving_average_of_days.dart';
import 'package:cryptovisor/core/entity/crypto_data/relative_strength_index_model.dart';

class ResponseDataCryptoAndBarChartModel {
  final double lastCloseValue;
  final List<RelativeStrengthIndexModel> relativeStrengthIndex;
  final List<ExponentialMovingAverageOfDays> exponentialMovingAverageOf8days;
  final List<ExponentialMovingAverageOfDays> exponentialMovingAverageOf14days;
  final List<ExponentialMovingAverageOfDays> exponentialMovingAverageOf30days;
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
    List<ExponentialMovingAverageOfDays> listEmaModel8Days = [];
    List<ExponentialMovingAverageOfDays> listEmaModel14Days = [];
    List<ExponentialMovingAverageOfDays> listEmaModel30Days = [];
    List<BollingerBandsModel> listBollingerModel = [];

    map['relativeStrengthIndex']
        .forEach((element) => rsiModel.add(RelativeStrengthIndexModel.fromMap(element)))
        .toList();
    map['exponentialMovingAverageOf8days']
        .forEach((element) => listEmaModel8Days.add(ExponentialMovingAverageOfDays.fromMap(element)))
        .toList();
    map['exponentialMovingAverageOf14days']
        .forEach((element) => listEmaModel14Days.add(ExponentialMovingAverageOfDays.fromMap(element)))
        .toList();
    map['exponentialMovingAverageOf30days']
        .forEach((element) => listEmaModel30Days.add(ExponentialMovingAverageOfDays.fromMap(element)))
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
