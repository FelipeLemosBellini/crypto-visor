import 'package:cryptovisor/routes/route_names.dart';
import 'package:cryptovisor/screens/structure/home/list_asset/list_asset_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListAssetBloc extends Cubit<ListAssetState> {
  ListAssetBloc() : super(ListAssetState());

  void goToDataAsset(BuildContext context) async {
    context.pushNamed(RouteNames.dataAssetPage, pathParameters: {"ticker": "BTC"});
  }
}
