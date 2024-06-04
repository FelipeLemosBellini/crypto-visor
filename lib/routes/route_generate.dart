import 'package:cryptovisor/core/entity/coin_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/response/response_data_crypto_and_bar_chart_model.dart';
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
        pageBuilder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final coinModel = data['coinModel'] as CoinModel;
          final dataModel = data['dataModel'] as ResponseDataCryptoAndBarChartModel;
          final listCandles = data['listCandles'] as List<CandleDataEntity>;

          return CupertinoPage(
              key: state.pageKey,
              child: DataAssetPage(
                coinModel: coinModel,
                listCandles: listCandles,
                dataCryptoAndBarChartModel: dataModel,
              ));
        }),
  ]);
}
// quando passa no pathParameters null ele quebra
// no extra eu consigo tratar esse null
