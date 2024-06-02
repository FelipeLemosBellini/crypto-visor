import 'dart:convert';

import 'package:cryptovisor/core/entity/coin_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/response/response_data_crypto_and_bar_chart_model.dart';
import 'package:cryptovisor/core/exception/crypto_visor_exception.dart';
import 'package:cryptovisor/core/helpers/crypto_visor_try_catch.dart';
import 'package:cryptovisor/core/repositories/data_crypto/interfaces/data_crypto_interface.dart';
import 'package:cryptovisor/core/service/api_rest/api_rest.dart';
import 'package:cryptovisor/core/service/api_rest/interfaces/api_rest_interface.dart';
import 'package:cryptovisor/core/settings_app.dart';
import 'package:dartz/dartz.dart';

class DataCryptoRepository extends IDataCryptoRepository {
  final IApiRest _apiRest = ApiRest();

  @override
  Future<Either<CryptoExceptionException, ResponseDataCryptoAndBarChartModel>> getDataAndCharts(
      {required String assetName}) async {
    return executeWithCatch(() async {
      var response = await _apiRest
          .get("${SettingsApp.baseApi}/OhlcStatistics?FirstDate=2024-04-01&LastDate=2024-05-14&ECoinType=$assetName");
      var decodedResponse = jsonDecode(response.toString());

      return ResponseDataCryptoAndBarChartModel.fromMap(decodedResponse['data']);
    });
  }

  @override
  Future<Either<CryptoExceptionException, List<CoinModel>>> getListCoins() async {
    return executeWithCatch(() async {
      var response = await _apiRest.get("${SettingsApp.baseApi}/Coins");
      List<CoinModel> list = [];
      var decodedResponse = jsonDecode(response.toString());

      for (var coinData in decodedResponse['data']) {
        list.add(CoinModel.fromMap(coinData));
      }

      return list;
    });
  }

  @override
  Future<Either<CryptoExceptionException, List<CandleDataEntity>>> getCandles({required String assetName}) async {
    return executeWithCatch(() async {
      var response = await _apiRest.get(
          "${SettingsApp.baseApi}/OhlcHistory/GetData?FirstDate=2024-04-01&LastDate=2024-05-14&ECoinType=$assetName");
      var decodedResponse = jsonDecode(response.toString());

      List<CandleDataEntity> list = [];

      for (var coinData in decodedResponse['data']) {
        list.add(CandleDataEntity.fromMap(coinData));
      }

      return list;
    });
  }
}
