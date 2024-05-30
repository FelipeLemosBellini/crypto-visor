import 'package:flutter/material.dart';

abstract class BaseChart {
  static double marginVertical = 30;
  static double paddingForNumbers = 0;

  static void createWords(
      {required Canvas canvas,
      required Size size,
      required List<double> numbers,
      required Color fontColor,
      required double proportion}) {
    size = Size(size.width - paddingForNumbers, size.height);
    for (int i = 0; i < numbers.length; i++) {
      TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
            text: numbers[i].toString(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: fontColor)),
      )..layout(maxWidth: 40, minWidth: 0);

      textPainter.paint(canvas, Offset(size.width, (size.height / 100 * (100 - numbers[i]) + marginVertical / 4)));
    }
  }

  static void createWordsDynamicChart(
      {required Canvas canvas,
      required Size size,
      required List<double> numbers,
      required Color fontColor,
      required double proportion}) {
    size = Size(size.width - paddingForNumbers - 10, size.height);

    for (int i = 0; i < numbers.length; i++) {
      TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
            text: numbers[i].toStringAsFixed(2).toString(),
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: fontColor)),
      )..layout(maxWidth: 40, minWidth: 0);

      textPainter.paint(
          canvas, Offset(size.width, (((size.height * ((i) / (numbers.length - 1)))) - (marginVertical / 4))));
    }
  }
}
