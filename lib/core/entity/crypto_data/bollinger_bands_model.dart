import 'package:cryptovisor/core/helpers/crypto_visor_format_number_helper.dart';

class BollingerBandsModel {
  final DateTime date;
  final double higherLine;
  final double lowerLine;
  final double baseLine;

  BollingerBandsModel({required this.date, required this.higherLine, required this.lowerLine, required this.baseLine});

  factory BollingerBandsModel.fromMap(Map<String, dynamic> map) {
    return BollingerBandsModel(
      date: DateTime.parse(map['date'].toString()),
      higherLine: CryptoVisorFormatNumberHelper.formatNumber(map['higher'] ?? 0.0),
      lowerLine: CryptoVisorFormatNumberHelper.formatNumber(map['lower'] ?? 0.0),
      baseLine: CryptoVisorFormatNumberHelper.formatNumber(map['base'] ?? 0.0),
    );
  }
}

// public DateTime Date {  get; set; }
// public double Higher {  get; set; }
// public double Lower { get; set; }
// public double Base { get; set; }
