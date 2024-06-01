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
      value: double.tryParse(map['value']) ?? 0.0,
    );
  }
}
