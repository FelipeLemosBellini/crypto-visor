import 'package:cryptovisor/routes/route_names.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_bloc.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_state.dart';
import 'package:cryptovisor/screens/widgets/export_crypto_visor_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class DataAssetPage extends StatefulWidget {
  final String ticker;

  const DataAssetPage({super.key, required this.ticker});

  @override
  State<DataAssetPage> createState() => _DataAssetPageState();
}

class _DataAssetPageState extends State<DataAssetPage> {
  final DataAssetBloc _bloc = GetIt.I.get<DataAssetBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataAssetBloc, DataAssetState>(
      bloc: _bloc,
      builder: (_, state) => Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CryptoVisorPillButton(
            onTap: () => context.pop(),
            text: "voltar",
          ),
          Text(widget.ticker)
        ],
      )),
    );
  }
}
