class RelativeStrengthIndexModel {
  final DateTime date;
  final double value;

  RelativeStrengthIndexModel({
    required this.date,
    required this.value,
  });

  factory RelativeStrengthIndexModel.fromMap(Map<String, dynamic> map) {
    return RelativeStrengthIndexModel(
      date: DateTime.parse(map["date"]),
      value: double.tryParse(map['value']) ?? 0.0,
    );
  }
}
