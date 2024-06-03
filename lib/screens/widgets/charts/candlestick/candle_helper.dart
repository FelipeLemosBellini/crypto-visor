import 'package:cryptovisor/core/entity/crypto_data/bollinger_bands_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';

import 'package:flutter/material.dart';

class CandleHelper {
  final List<CandleDataEntity> listCandle;
  final List<BollingerBandsModel> listBollinger;

  CandleHelper({required this.listCandle, required this.listBollinger}) {
    _setMaxValue();
    _setMinValue();
  }

  void _setMaxValue() {
    for (CandleDataEntity candle in listCandle) {
      if (candle.high > _maxValue) _maxValue = candle.high;
    }
    for (BollingerBandsModel model in listBollinger) {
      if (model.higherLine > _maxValue) _maxValue = model.higherLine;
    }
  }

  void _setMinValue() {
    _minValue = listCandle.first.low;
    for (CandleDataEntity candle in listCandle) {
      if (candle.low < _minValue) _minValue = candle.low;
    }
    for (BollingerBandsModel model in listBollinger) {
      if (model.lowerLine < _minValue) _minValue = model.lowerLine;
    }
  }

  double _maxValue = 0;
  double _minValue = 0;

  double multipleProportionTopCandles(Size size, double convertValue) {
    double proportion = (convertValue - _minValue) / (_maxValue - _minValue);

    return proportion * size.height;
  }

  List<double> get getNumbersForParameterChart {
    List<double> list = [];

    double middleNumber = (_maxValue + _minValue) / 2;
    double midTopNumber = (_maxValue + middleNumber) / 2;
    double midBottomNumber = (_minValue + middleNumber) / 2;
    list.add(_setNumberWithFixed(_maxValue));
    list.add(_setNumberWithFixed(midTopNumber));
    list.add(_setNumberWithFixed(middleNumber));
    list.add(_setNumberWithFixed(midBottomNumber));
    list.add(_setNumberWithFixed(_minValue));
    return list;
  }

  double _setNumberWithFixed(double number, {int? fractionDigits = 2}) {
    String valueFormatted = number.toStringAsFixed(fractionDigits!);
    return double.parse(valueFormatted);
  }

}
