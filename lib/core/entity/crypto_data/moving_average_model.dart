import 'package:cryptovisor/core/helpers/crypto_visor_format_number_helper.dart';

class MovingAverageOfModel {
  final DateTime date;
  final double value;

  MovingAverageOfModel({
    required this.date,
    required this.value,
  });

  factory MovingAverageOfModel.fromMap(Map<String, dynamic> map) {
    return MovingAverageOfModel(
      date: DateTime.parse(map["date"]),
      value: CryptoVisorFormatNumberHelper.formatNumber(map['value'] ?? 0.0),
    );
  }
}
