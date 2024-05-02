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
    // List<RelativeStrengthIndexModel> newList = [];
    // for (int i = 0; i < state.rsi.length; i++) {
    //   newList.add(state.rsi[i]);
    // }
    //
    // emit(state.copyWith(rsi: newList));
    // var response = await _dataCryptoRepository.getDataAndCharts(ticker: "BTC");
    // response.fold((error) => print(error), (ResponseDataCryptoAndBarChartModel success) {
    // state.averageEight = success.exponentialMovingAverageOf8days;
    // });
  }
}
