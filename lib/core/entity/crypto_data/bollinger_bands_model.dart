class BollingerBandsModel {
  final DateTime date;
  final double higher;
  final double lower;
  final double base;

  BollingerBandsModel({required this.date, required this.higher, required this.lower, required this.base});

  factory BollingerBandsModel.fromMap(Map<String, dynamic> map) {
    return BollingerBandsModel(
      date: DateTime.parse(map['date'].toString()),
      higher: double.tryParse(map['higher'].toString()) ?? 0.0,
      lower: double.tryParse(map['lower'].toString()) ?? 0.0,
      base: double.tryParse(map['base'].toString()) ?? 0.0,
    );
  }
}

// public DateTime Date {  get; set; }
// public double Higher {  get; set; }
// public double Lower { get; set; }
// public double Base { get; set; }
