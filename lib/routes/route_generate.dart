import 'package:cryptovisor/core/entity/coin_model.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:cryptovisor/routes/route_names.dart';
import 'package:cryptovisor/screens/structure/home/list_asset/list_asset_page.dart';

abstract class RouteGenerate {
  static GoRouter router = GoRouter(initialLocation: RouteNames.initial, routes: <RouteBase>[
    GoRoute(path: RouteNames.initial, pageBuilder: (context, state) => const CupertinoPage(child: ListAssetPage())),
    GoRoute(
        name: RouteNames.dataAssetPage,
        path: RouteNames.dataAssetPage,
        pageBuilder: (context, state) =>
            CupertinoPage(key: state.pageKey, child: DataAssetPage(coinModel: state.extra as CoinModel))),
  ]);
}
// quando passa no pathParameters null ele quebra
// no extra eu consigo tratar esse null
