import 'package:flutter/material.dart';

class FoxbitBankCandlestickPaintDimensModel {
  final double centerX;
  final double wickHighY;
  final double wickLowY;
  final double candleHighY;
  final double candleLowY;
  final Paint candlePaint;

  FoxbitBankCandlestickPaintDimensModel({
    required this.centerX,
    required this.candleHighY,
    required this.candleLowY,
    required this.candlePaint,
    required this.wickHighY,
    required this.wickLowY,
  });
}
