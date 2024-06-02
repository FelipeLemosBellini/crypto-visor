import 'package:cryptovisor/core/entity/coin_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/response/response_data_crypto_and_bar_chart_model.dart';
import 'package:dartz/dartz.dart';
import 'package:cryptovisor/core/exception/crypto_visor_exception.dart';

abstract class IDataCryptoRepository {
  Future<Either<CryptoExceptionException, ResponseDataCryptoAndBarChartModel>> getDataAndCharts(
      {required String assetName});

  Future<Either<CryptoExceptionException, List<CandleDataEntity>>> getCandles({required String assetName});

  Future<Either<CryptoExceptionException, List<CoinModel>>> getListCoins();
}
