import 'dart:math';

import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/crypto_data/bollinger_bands_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/moving_average_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/relative_strength_index_model.dart';
import 'package:cryptovisor/core/entity/response/response_data_crypto_and_bar_chart_model.dart';
import 'package:cryptovisor/core/repositories/data_crypto/data_crypto_repository.dart';
import 'package:cryptovisor/core/repositories/data_crypto/interfaces/data_crypto_interface.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DataAssetBloc extends Cubit<DataAssetState> {
  final IDataCryptoRepository _dataCryptoRepository = GetIt.I.get<DataCryptoRepository>();

  DataAssetBloc() : super(DataAssetState()) {
    _initPage();
  }

  void _initPage() async {
    _createCandles();
    _createRSI();
    _createBollinger();
    _createMovingAverage();
  }

  void setValueBollinger(bool? value) {
    emit(state.copyWith(showBollinger: value!));
  }

  void setValueMovingAverage14(bool? value) {
    emit(state.copyWith(showMovingAverage14: value!));
  }

  void _createCandles() {
    List<CandleDataEntity> candleData = [];

    for (int i = 0; i < 20; i++) {
      DateTime timestamp = DateTime(2024, 1, 1 + i);
      double open = Random().nextDouble() * (1000 - 0) + 0;
      double high = open + Random().nextDouble() * (1000 - open);
      double low = open - Random().nextDouble() * (open - 0);
      double close = low + Random().nextDouble() * (high - low);

      candleData.add(CandleDataEntity(
        timestamp: timestamp,
        open: double.parse(open.toStringAsFixed(2)),
        high: double.parse(high.toStringAsFixed(2)),
        low: double.parse(low.toStringAsFixed(2)),
        close: double.parse(close.toStringAsFixed(2)),
      ));
    }
    emit(state.copyWith(candles: candleData));
  }

  void _createBollinger() {
    List<BollingerBandsModel> bollingerData = [];

    for (int i = 0; i < 15; i++) {
      DateTime timestamp = DateTime(2024, 1, 1 + i);
      double open = Random().nextDouble() * (1000 - 0) + 0;
      double high = open + Random().nextDouble() * (1000 - open);
      double low = open - Random().nextDouble() * (open - 0);
      double close = low + Random().nextDouble() * (high - low);

      bollingerData.add(BollingerBandsModel(
        date: timestamp,
        higherLine: double.parse(high.toStringAsFixed(2)),
        baseLine: double.parse(close.toStringAsFixed(2)),
        lowerLine: double.parse(low.toStringAsFixed(2)),
      ));
    }
    emit(state.copyWith(bollinger: bollingerData));
  }

  void _createRSI() {
    List<RelativeStrengthIndexModel> rsiData = [];

    for (int i = 0; i < 15; i++) {
      DateTime timestamp = DateTime(2024, 1, 1 + i);
      double open = Random().nextDouble() * (100 - 0) + 0;

      rsiData.add(RelativeStrengthIndexModel(date: timestamp, value: double.parse(open.toStringAsFixed(2))));
    }
    emit(state.copyWith(rsi: rsiData));
  }

  void _createMovingAverage() {
    List<MovingAverageOfModel> listAverage = [];

    for (int i = 0; i < 15; i++) {
      DateTime timestamp = DateTime(2024, 1, 1 + i);
      double open = Random().nextDouble() * (1000 - 0) + 0;

      listAverage.add(MovingAverageOfModel(date: timestamp, value: double.parse(open.toStringAsFixed(2))));
    }
    emit(state.copyWith(movingAverage14: listAverage));
  }
}
