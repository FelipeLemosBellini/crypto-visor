import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:cryptovisor/screens/structure/home/list_asset/list_asset_bloc.dart';
import 'package:cryptovisor/screens/structure/home/list_asset/list_asset_state.dart';
import 'package:cryptovisor/screens/widgets/export_crypto_visor_material.dart';
import 'package:cryptovisor/screens/widgets/item_coin_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class ListAssetPage extends StatefulWidget {
  const ListAssetPage({super.key});

  @override
  State<ListAssetPage> createState() => _ListAssetPageState();
}

class _ListAssetPageState extends State<ListAssetPage> {
  final ListAssetBloc _bloc = GetIt.I.get<ListAssetBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListAssetBloc, ListAssetState>(
        bloc: _bloc,
        builder: (_, state) => Scaffold(
            backgroundColor: CryptoVisorColors.scaffoldColor,
            body: Visibility(
              visible: state.listAssets.isNotEmpty,
              child: ListView.builder(itemCount: state.listAssets.length,itemBuilder: (_, index) {
                return IconCoinListWidget(coinModel: state.listAssets[index]);
              }),
            )));
  }
}
