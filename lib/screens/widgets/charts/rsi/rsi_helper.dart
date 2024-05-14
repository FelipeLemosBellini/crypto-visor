import 'package:flutter/material.dart';

abstract class RSIHelper {
  static Paint paintBackground = Paint()..color = const Color(0xFF181C27);
  static Paint paintRangeInternal = Paint()..color = const Color(0xFF212035);
  static Paint lineRSI = Paint()
    ..strokeWidth = 2
    ..color = const Color(0xFF7E57C2);
  static Paint lineDashed = Paint()
    ..strokeWidth = 1
    ..color = const Color(0xFF787B86);

  static Paint contourLine = Paint()
    ..color = Colors.white54
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;
}
