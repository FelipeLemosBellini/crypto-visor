import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/crypto_data/bollinger_bands_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/moving_average_model.dart';
import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:cryptovisor/screens/widgets/charts/base_chart.dart';
import 'package:cryptovisor/screens/widgets/charts/candlestick/candle_helper.dart';
import 'package:cryptovisor/screens/widgets/charts/rsi/rsi_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CandleSticksChartPainter extends CustomPainter {
  final List<CandleDataEntity> candles;
  final List<BollingerBandsModel> bollingerBandsModel;
  final List<MovingAverageOfModel> movingAverageModel8;
  final List<MovingAverageOfModel> movingAverageModel14;
  final List<MovingAverageOfModel> movingAverageModel30;
  final bool showBollinger;
  final bool showMovingAverage8;
  final bool showMovingAverage14;
  final bool showMovingAverage30;

  late CandleHelper candleHelper;
  List<double> linesDashed = [0.0, 20.0, 50.0, 80.0, 100.0];

  CandleSticksChartPainter(
      {required this.movingAverageModel8,
      required this.movingAverageModel14,
      required this.movingAverageModel30,
      required this.showBollinger,
      required this.showMovingAverage8,
      required this.showMovingAverage14,
      required this.showMovingAverage30,
      required this.candles,
      required this.bollingerBandsModel}) {
    candleHelper = CandleHelper(listCandle: candles, listBollinger: bollingerBandsModel);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Size sizeChart = Size(size.width * 0.8, size.height);
    Size sizeCandles = Size(sizeChart.width, sizeChart.height);

    _createBackground(canvas, sizeChart);
    _createCandles(canvas, sizeCandles);
    _createCandlesLines(canvas, sizeCandles);
    if (showBollinger) _createBollingerLine(canvas, sizeCandles);
    _createBandDashedLine(canvas, sizeChart);
    if (showMovingAverage8) _createMovingAverage(canvas, sizeChart, movingAverageModel8, RSIHelper.averageLine8);
    if (showMovingAverage14) _createMovingAverage(canvas, sizeChart, movingAverageModel14, RSIHelper.averageLine14);
    if (showMovingAverage30) _createMovingAverage(canvas, sizeChart, movingAverageModel30, RSIHelper.averageLine30);
    _createLineAround(canvas, sizeChart);
    BaseChart.createWordsDynamicChart(
        canvas: canvas,
        size: Size(sizeChart.width + (sizeChart.width * 0.1), sizeChart.height),
        numbers: candleHelper.getNumbersForParameterChart,
        fontColor: CryptoVisorColors.whiteLabel.withOpacity(0.5));
  }

  void _createBackground(Canvas canvas, Size size) {
    final rectBackground = Rect.fromLTWH(0, 0, size.width, (size.height));
    canvas.drawRect(rectBackground, Paint()..color = const Color(0xFF161A25));
  }

  void _createLineAround(Canvas canvas, Size size) {
    Paint contourLine = Paint()
      ..color = Colors.white54
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), contourLine);
  }

  void _createCandles(Canvas canvas, Size size) {
    double distanceCandle = BaseChart.distanceCandle(sizeChart: size, lengthList: candles.length);
    double sizeCandle = BaseChart.sizeCandle(sizeChart: size, lengthList: candles.length + 1);

    double distance = 0;
    distance += distanceCandle;
    for (int i = 0; i < candles.length; i++) {
      distance += distanceCandle;
      double left = size.width - (distance + (sizeCandle * i)) - distanceCandle;

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
    double distanceCandle = BaseChart.distanceCandle(sizeChart: size, lengthList: candles.length);
    double sizeCandle = BaseChart.sizeCandle(sizeChart: size, lengthList: candles.length + 1);
    double candleWidth = (distanceCandle * (candles.length + 2) + sizeCandle * candles.length) / size.width;

    double distance = 0;

    distance += distanceCandle;
    for (int i = 0; i < candles.length; i++) {
      distance += distanceCandle;
      double left = size.width - (distance + (sizeCandle * i) - (sizeCandle / 2) + candleWidth) - distanceCandle;

      double top = candleHelper.multipleProportionTopCandles(size, candles[i].high);
      double sizeCandleHeight = candleHelper.multipleProportionTopCandles(size, candles[i].low);

      Paint paint = Paint()..color = candles[i].colorCandle;
      final rectBackground = Rect.fromLTWH(left, size.height - top, candleWidth, top - sizeCandleHeight);

      canvas.drawRect(rectBackground, paint);
    }
  }

  void _createBandDashedLine(Canvas canvas, Size size) {
    int dashedLineQuantity = (size.width / 10).round();
    for (double line in linesDashed) {
      double heightLine = (size.height / 100) * line;
      for (int i = 0; i < dashedLineQuantity; i++) {
        if (i.isEven) {
          Offset lineStart = Offset((i * (size.width / dashedLineQuantity)), heightLine);
          Offset lineEnd = Offset(((i + 1) * (size.width / dashedLineQuantity)), heightLine);

          canvas.drawLine(lineStart, lineEnd, RSIHelper.lineDashed);
        }
      }
    }
  }

  void _createBollingerLine(Canvas canvas, Size size) {
    List<double> higherLine = [];
    List<double> baseLine = [];
    List<double> lowerLine = [];

    for (var model in bollingerBandsModel) {
      higherLine.add(model.higherLine);
      baseLine.add(model.baseLine);
      lowerLine.add(model.lowerLine);
    }
    _drawMovingAverageLine(canvas, size, RSIHelper.externalBollingerLine, higherLine);
    _drawMovingAverageLine(canvas, size, RSIHelper.midBollingerLine, baseLine);
    _drawMovingAverageLine(canvas, size, RSIHelper.externalBollingerLine, lowerLine);
  }

  void _createMovingAverage(Canvas canvas, Size size, List<MovingAverageOfModel> listAverage, Paint paint) {
    List<double> moving = [];

    for (var model in listAverage) {
      moving.add(model.value);
    }

    _drawMovingAverageLine(canvas, size, paint, moving);
  }

  void _drawMovingAverageLine(Canvas canvas, Size size, Paint paint, List<double> value) {
    double distanceCandle = BaseChart.distanceCandle(sizeChart: size, lengthList: candles.length);
    double sizeCandle = BaseChart.sizeCandle(sizeChart: size, lengthList: candles.length + 1);
    double candleWidth = (distanceCandle * (candles.length + 2) + sizeCandle * candles.length) / size.width;

    double distance = 0;

    distance += distanceCandle;
    for (int position = 0; position < value.length - 1; position++) {
      distance += distanceCandle;
      double left = size.width - (distance + (sizeCandle * position) - (sizeCandle / 2) + candleWidth) - distanceCandle;

      double leftNext = size.width -
          (distance + (sizeCandle * (position + 1)) - (sizeCandle / 2) + candleWidth) -
          (distanceCandle * 2);

      double heightProportion = size.height - candleHelper.multipleProportionTopCandles(size, value[position]);
      double nextHeightProportion = size.height - candleHelper.multipleProportionTopCandles(size, value[position + 1]);
      Offset lineStart = Offset(left, heightProportion);
      Offset lineEnd = Offset(leftNext, nextHeightProportion);
      canvas.drawLine(lineStart, lineEnd, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
