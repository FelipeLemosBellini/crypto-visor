class ExponentialMovingAverageOfDays {
  final DateTime date;
  final double value;

  ExponentialMovingAverageOfDays({
    required this.date,
    required this.value,
  });

  factory ExponentialMovingAverageOfDays.fromMap(Map<String, dynamic> map) {
    return ExponentialMovingAverageOfDays(
      date: DateTime.parse(map["date"]),
      value: double.tryParse(map['value']) ?? 0.0,
    );
  }
}
