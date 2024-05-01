import 'package:cryptovisor/routes/animation_transitions.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cryptovisor/routes/route_names.dart';
import 'package:cryptovisor/screens/structure/home/list_asset/list_asset_page.dart';

abstract class RouteGenerate {
  static GoRouter router = GoRouter(initialLocation: RouteNames.initial, routes: [
    GoRoute(
        path: RouteNames.initial,
        pageBuilder: (context, state) => const MaterialPage(fullscreenDialog: true, child: ListAssetPage())),
    GoRoute(
        name: RouteNames.dataAssetPage,
        path: "${RouteNames.dataAssetPage}/:ticker",
        pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 600),
            transitionsBuilder: AnimationTransitions.rightToLeft,
            child: DataAssetPage(ticker: state.pathParameters["ticker"] ?? ""))),
  ]);
}
// quando passa no pathParameters null ele quebra
// no extra eu consigo tratar esse null
