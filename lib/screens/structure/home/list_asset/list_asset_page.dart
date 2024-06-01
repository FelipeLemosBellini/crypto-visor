import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:cryptovisor/screens/helper/export_helper_screen.dart';
import 'package:cryptovisor/screens/structure/home/list_asset/list_asset_bloc.dart';
import 'package:cryptovisor/screens/structure/home/list_asset/list_asset_state.dart';
import 'package:cryptovisor/screens/widgets/app_bar/crypto_visor_title_app_bar.dart';
import 'package:cryptovisor/screens/widgets/export_crypto_visor_material.dart';
import 'package:cryptovisor/screens/widgets/item_coin_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
            appBar: const CryptoVisorTitleAppBar(textTitle: "Lista de moedas"),
            body: Column(children: [
              Container(
                  color: const Color(0xFF414450),
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  child: Row(children: [
                    const Flexible(
                        flex: 1, child: Icon(Icons.data_usage, size: 48, color: CryptoVisorColors.primaryColor)),
                    const Spacer(),
                    Flexible(
                        flex: 8,
                        child: const Text(
                                "CryptoVisor é o seu gerador de cotações com indicadores técnicos para tomada de decisão em mercados voláteis",
                                textAlign: TextAlign.left)
                            .bodyBaseRegular())
                  ])),
              Expanded(
                  child: Visibility(
                      visible: state.listAssets.isNotEmpty,
                      child: ListView.separated(
                          itemCount: state.listAssets.length,
                          separatorBuilder: (_, __) => const Divider(color: Color(0x0f6e6e6e), height: 1, thickness: 2),
                          itemBuilder: (_, index) => IconCoinListWidget(coinModel: state.listAssets[index]))))
            ])));
  }
}
