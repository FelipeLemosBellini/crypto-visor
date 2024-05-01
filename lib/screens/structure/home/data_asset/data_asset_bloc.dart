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
    var response = await _dataCryptoRepository.getDataAndCharts(ticker: "BTC");
    response.fold((error) => print(error), (r) {
      print(r.lastCloseValue);
      print(r.bollingerBands.first.date);
    });
  }
}
