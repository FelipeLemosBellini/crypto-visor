import 'dart:convert';

import 'package:cryptovisor/core/entity/coin_model.dart';
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
      {required String ticker}) async {
    return executeWithCatch(() async {
      // var response = await _apiRest.get("", query: {"ticker": ticker});
      // return ResponseDataCryptoAndBarChartModel.fromMap(response.data);
      Map<String, dynamic> json = {
        "lastCloseValue": 10.0,
        "relativeStrengthIndex": [],
        "exponentialMovingAverageOf8days": [],
        "exponentialMovingAverageOf14days": [],
        "exponentialMovingAverageOf30days": [],
        "bollingerBands": [
          {"date": "2024-05-01T18:19:51.833Z", "higher": 0.0, "lower": 0.0, "base": 0.0}
        ]
      };
      return ResponseDataCryptoAndBarChartModel.fromMap(json);
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
}
