import 'package:cryptovisor/core/entity/crypto_data/exponential_moving_average_of_days.dart';
import 'package:cryptovisor/core/entity/crypto_data/relative_strength_index_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RSIChartPainter extends CustomPainter {
  final List<RelativeStrengthIndexModel> averages;

  RSIChartPainter({required this.averages});

  List<int> linesDashed = [20, 50, 80];

  @override
  void paint(Canvas canvas, Size size) {
    _createBackground(canvas, size);
    _createRSILine(canvas, size);
    _createBandDashedLine(canvas, size);

    final paint = Paint()
      ..color = Colors.white54
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  void _createBackground(Canvas canvas, Size size) {
    Paint paintBackground = Paint()..color = const Color(0xFF181C27);
    final rectBackground = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rectBackground, paintBackground);
    Paint paint = Paint()..color = const Color(0xFF212035);
    final rect = Rect.fromLTWH(0, (size.height / 100) * linesDashed.first, size.width,
        (size.height / 100) * (linesDashed.last - linesDashed.first));
    canvas.drawRect(rect, paint);
  }

  void _createRSILine(Canvas canvas, Size size) {
    Paint line = Paint()
      ..strokeWidth = 1
      ..color = const Color(0xFF7E57C2);
    for (int countLineRSi = 0; countLineRSi < averages.length - 1; countLineRSi++) {
      Offset lineStart = Offset(
          10 + (countLineRSi * size.width / averages.length), (size.height / 100) * averages[countLineRSi].value);
      Offset lineEnd = Offset(10 + ((countLineRSi + 1) * size.width / averages.length),
          (size.height / 100) * averages[countLineRSi + 1].value);
      canvas.drawLine(lineStart, lineEnd, line);
    }
  }

  void _createBandDashedLine(Canvas canvas, Size size) {
    int dashedLineQuantity = (size.width / 10).round();
    for (int line in linesDashed) {
      double heightLine = (size.height / 100) * line;
      for (int i = 0; i < dashedLineQuantity; i++) {
        if (i.isEven) {
          Offset lineStart = Offset((i * (size.width / dashedLineQuantity)), heightLine);
          Offset lineEnd = Offset(((i + 1) * (size.width / dashedLineQuantity)), heightLine);

          Paint lineColor = Paint()
            ..strokeWidth = 1
            ..color = const Color(0xFF787B86);

          canvas.drawLine(lineStart, lineEnd, lineColor);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
