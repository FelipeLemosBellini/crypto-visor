import 'package:cryptovisor/core/entity/candle_data_entity.dart';
import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:cryptovisor/screens/widgets/charts/base_chart.dart';
import 'package:cryptovisor/screens/widgets/charts/candlestick/candle_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CandleSticksChartPainter extends CustomPainter {
  final List<CandleDataEntity> candles;

  late CandleHelper candleHelper;

  CandleSticksChartPainter({required this.candles}) {
    candleHelper = CandleHelper(listCandle: candles);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Size sizeChart = Size(size.width - 50, size.height);
    Size sizeCandles = Size(sizeChart.width - 10, sizeChart.height);

    _createBackground(canvas, sizeChart);
    _createLineAround(canvas, sizeChart);
    _createCandles(canvas, sizeCandles);
    _createCandlesLines(canvas, sizeCandles);
    BaseChart.createWordsDynamicChart(
        canvas: canvas,
        size: size,
        proportion: 35,
        numbers: candleHelper.getNumbersForParameterChart,
        fontColor: CryptoVisorColors.whiteLabel.withOpacity(0.5));
  }

  void _createBackground(Canvas canvas, Size size) {
    final rectBackground = Rect.fromLTWH(0, 0, size.width, ((size.height)));
    canvas.drawRect(rectBackground, Paint()..color = const Color(0xFF161A25));
  }

  void _createLineAround(Canvas canvas, Size size) {
    Paint contourLine = Paint()
      ..color = Colors.white54
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, contourLine);
  }

  void _createCandles(Canvas canvas, Size size) {
    double distanceCandle = size.width * 0.5 / candles.length;
    double sizeCandle = (size.width * 0.5 / candles.length) < 20 ? size.width * 0.5 / candles.length : 10;

    double distance = 0;
    for (int i = 0; i < candles.length; i++) {
      distance += distanceCandle;
      double left = size.width - (distance + (sizeCandle * i));

      double top = candleHelper.multipleProportionTopCandles(size, candles[i].open);
      double sizeCandleHeight = candleHelper.multipleProportionTopCandles(size, candles[i].close);

      Paint paint = Paint()
        ..color = candles[i].colorCandle
        ..strokeWidth = 1.5;
      final rectBackground = Rect.fromLTWH(left, size.height - top, sizeCandle, top - sizeCandleHeight);

      canvas.drawRect(rectBackground, paint);
    }
  }

  void _createCandlesLines(Canvas canvas, Size size) {
    double distanceCandle = size.width * 0.5 / candles.length;
    double sizeCandle = (size.width * 0.5 / candles.length) < 20 ? size.width * 0.5 / candles.length : 10;
    double candleWidth = sizeCandle/10;

    double distance = 0;
    for (int i = 0; i < candles.length; i++) {
      distance += distanceCandle;
      double left = size.width - (distance + (sizeCandle * i) - (sizeCandle / 2)+candleWidth);

      double top = candleHelper.multipleProportionTopCandles(size, candles[i].high);
      double sizeCandleHeight = candleHelper.multipleProportionTopCandles(size, candles[i].low);

      Paint paint = Paint()
        ..color = candles[i].colorCandle
        ..strokeWidth = 1.5;
      final rectBackground = Rect.fromLTWH(left, size.height - top, candleWidth, top - sizeCandleHeight);

      canvas.drawRect(rectBackground, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
