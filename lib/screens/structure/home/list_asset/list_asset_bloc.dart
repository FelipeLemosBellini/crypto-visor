import 'package:cryptovisor/core/entity/coin_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/response/response_data_crypto_and_bar_chart_model.dart';
import 'package:cryptovisor/core/repositories/data_crypto/data_crypto_repository.dart';
import 'package:cryptovisor/core/repositories/data_crypto/interfaces/data_crypto_interface.dart';
import 'package:cryptovisor/routes/route_names.dart';
import 'package:cryptovisor/screens/structure/home/list_asset/list_asset_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ListAssetBloc extends Cubit<ListAssetState> {
  final IDataCryptoRepository dataCryptoRepository;

  ListAssetBloc({required this.dataCryptoRepository}) : super(ListAssetState()) {
    getListCoin();
  }

  void goToDataAsset(BuildContext context, CoinModel coinModel) async {
    List<CandleDataEntity> candles = await _getCandles(coinModel.name);
    ResponseDataCryptoAndBarChartModel data = await _getStatistics(coinModel.name);
    if (candles.isNotEmpty &&
        data.lastCloseValue != null &&
        data.exponentialMovingAverageOf30days.isNotEmpty &&
        data.exponentialMovingAverageOf14days.isNotEmpty &&
        data.exponentialMovingAverageOf8days.isNotEmpty &&
        data.relativeStrengthIndex.isNotEmpty &&
        data.bollingerBands.isNotEmpty) {
      context.pushNamed(RouteNames.dataAssetPage,
          extra: {'coinModel': coinModel, 'dataModel': data, 'listCandles': candles});
    }
  }

  Future<List<CandleDataEntity>> _getCandles(String nameAsset) async {
    var response = await dataCryptoRepository.getCandles(assetName: nameAsset);
    List<CandleDataEntity> listCandles = [];
    response.fold((l) => l, (response) {
      listCandles = response.reversed.toList();
    });
    return listCandles;
  }

  Future<ResponseDataCryptoAndBarChartModel> _getStatistics(String nameAsset) async {
    late ResponseDataCryptoAndBarChartModel model;
    var response = await dataCryptoRepository.getDataAndCharts(assetName: nameAsset);
    response.fold((l) => l, (response) {
      model = response;
    });
    return model;
  }

  void getListCoin() async {
    var response = await dataCryptoRepository.getListCoins();

    response.fold((l) => print(l), (list) => emit(state.copyWith(listAssets: list)));
  }
}
