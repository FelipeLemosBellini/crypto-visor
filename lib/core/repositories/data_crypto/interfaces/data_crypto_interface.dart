import 'package:cryptovisor/core/entity/response/response_data_crypto_and_bar_chart_model.dart';
import 'package:dartz/dartz.dart';
import 'package:cryptovisor/core/exception/crypto_visor_exception.dart';

abstract class IDataCryptoRepository {
  Future<Either<CryptoExceptionException, ResponseDataCryptoAndBarChartModel>> getDataAndCharts(
      {required String ticker});
}
