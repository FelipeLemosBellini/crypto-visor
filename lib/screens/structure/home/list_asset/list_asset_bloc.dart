import 'package:cryptovisor/core/repositories/data_crypto/data_crypto_repository.dart';
import 'package:cryptovisor/core/repositories/data_crypto/interfaces/data_crypto_interface.dart';
import 'package:cryptovisor/routes/route_names.dart';
import 'package:cryptovisor/screens/structure/home/list_asset/list_asset_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ListAssetBloc extends Cubit<ListAssetState> {
  final IDataCryptoRepository _dataCryptoRepository = GetIt.I.get<DataCryptoRepository>();

  ListAssetBloc() : super(ListAssetState());

  void goToDataAsset(BuildContext context) async {
    var response = await _dataCryptoRepository.getDataAndCharts(ticker: "BTC");
    response.fold((error) => print(error), (r) {
      print(r.lastCloseValue);
      print(r.bollingerBands.first.date);
    });

    // context.goNamed(RouteNames.dataAssetPage, pathParameters: {"ticker": "BTC"});
  }
}
