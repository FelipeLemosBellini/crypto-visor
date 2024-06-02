import 'package:cryptovisor/core/helpers/crypto_visor_format_number_helper.dart';

class RelativeStrengthIndexModel {
  final DateTime date;
  final double value;

  RelativeStrengthIndexModel({
    required this.date,
    required this.value,
  });

  factory RelativeStrengthIndexModel.fromMap(Map<String, dynamic> map) {
    return RelativeStrengthIndexModel(
      date: DateTime.tryParse(map["date"]) ?? DateTime.now(),
      value: CryptoVisorFormatNumberHelper.formatNumber(map['value'] ?? 0.0),
    );
  }
}
