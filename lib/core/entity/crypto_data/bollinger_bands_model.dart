class BollingerBandsModel {
  final DateTime date;
  final double higherLine;
  final double lowerLine;
  final double baseLine;

  BollingerBandsModel({required this.date, required this.higherLine, required this.lowerLine, required this.baseLine});

  factory BollingerBandsModel.fromMap(Map<String, dynamic> map) {
    return BollingerBandsModel(
      date: DateTime.parse(map['date'].toString()),
      higherLine: double.tryParse(map['higher'].toString()) ?? 0.0,
      lowerLine: double.tryParse(map['lower'].toString()) ?? 0.0,
      baseLine: double.tryParse(map['base'].toString()) ?? 0.0,
    );
  }
}

// public DateTime Date {  get; set; }
// public double Higher {  get; set; }
// public double Lower { get; set; }
// public double Base { get; set; }
