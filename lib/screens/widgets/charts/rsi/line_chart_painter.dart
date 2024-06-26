import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/crypto_data/relative_strength_index_model.dart';
import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:cryptovisor/screens/widgets/charts/base_chart.dart';
import 'package:cryptovisor/screens/widgets/charts/candlestick/candle_helper.dart';
import 'package:cryptovisor/screens/widgets/charts/rsi/rsi_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RSIChartPainter extends CustomPainter {
  final List<RelativeStrengthIndexModel> averages;
  final List<CandleDataEntity> candles;

  RSIChartPainter({required this.averages, required this.candles});

  List<double> linesDashed = [0.0, 20.0, 50.0, 80.0, 100.0];
  double paddingNumberForChart = 35;

  @override
  void paint(Canvas canvas, Size size) {
    if (candles.isNotEmpty && averages.isNotEmpty) {
      Size sizeChart = Size(size.width * 0.8, size.height + (BaseChart.marginVertical) / 2);

      _createBackground(canvas, sizeChart);
      _createRSILine(canvas, sizeChart);
      _createBandDashedLine(canvas, sizeChart);
      _createLineAround(canvas, sizeChart);
      BaseChart.createWords(
          canvas: canvas,
          size: Size(sizeChart.width + (sizeChart.width * 0.05), sizeChart.height),
          numbers: linesDashed,
          fontColor: CryptoVisorColors.whiteLabel.withOpacity(0.5));
      BaseChart.createWords(
          canvas: canvas,
          size: Size(sizeChart.width + (sizeChart.width * 0.05), sizeChart.height),
          numbers: [averages.first.value],
          fontColor: Colors.white);
    }
  }

  void _createBackground(Canvas canvas, Size size) {
    double startHeightRSIBackgroundFill = 20;
    double heightRSIBackgroundFill = 60;

    final rectBackground = Rect.fromLTWH(0, 0, size.width, ((size.height)) + BaseChart.marginVertical);
    canvas.drawRect(rectBackground, RSIHelper.paintBackground);
    final rect = Rect.fromLTWH(0, ((size.height / 100) * startHeightRSIBackgroundFill) + BaseChart.marginVertical / 2,
        size.width, (size.height / 100) * heightRSIBackgroundFill);
    canvas.drawRect(rect, RSIHelper.paintRangeInternal);
  }

  void _createRSILine(Canvas canvas, Size size) {
    List<double> moving = [];

    for (var model in averages) {
      moving.add(model.value);
    }

    moving = moving.reversed.toList();

    _drawMovingAverageLine(canvas, size, RSIHelper.lineRSI, moving);
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

      double heightProportion =
          (((size.height / 100) * (100 - averages[position].value)) + BaseChart.marginVertical / 2);
      double nextHeightProportion =
          (((size.height / 100) * (100 - averages[position + 1].value)) + BaseChart.marginVertical / 2);
      Offset lineStart = Offset(left, heightProportion);
      Offset lineEnd = Offset(leftNext, nextHeightProportion);
      canvas.drawLine(lineStart, lineEnd, paint);
    }
  }

  void _createBandDashedLine(Canvas canvas, Size size) {
    int dashedLineQuantity = (size.width / 10).round();
    for (double line in linesDashed) {
      double heightLine = (size.height / 100) * line;
      for (int i = 0; i < dashedLineQuantity; i++) {
        if (i.isEven) {
          Offset lineStart =
              Offset((i * (size.width / dashedLineQuantity)), heightLine + (BaseChart.marginVertical / 2));
          Offset lineEnd =
              Offset(((i + 1) * (size.width / dashedLineQuantity)), heightLine + (BaseChart.marginVertical / 2));

          canvas.drawLine(lineStart, lineEnd, RSIHelper.lineDashed);
        }
      }
    }
  }

  void _createLineAround(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height + BaseChart.marginVertical), RSIHelper.contourLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
