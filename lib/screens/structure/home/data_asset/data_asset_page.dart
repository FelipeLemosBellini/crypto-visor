import 'package:cryptovisor/core/entity/coin_model.dart';
import 'package:cryptovisor/routes/route_names.dart';
import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:cryptovisor/screens/helper/export_helper_screen.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_bloc.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_state.dart';
import 'package:cryptovisor/screens/widgets/charts/candlestick/candlestick_chart_painter.dart';
import 'package:cryptovisor/screens/widgets/charts/rsi/line_chart_painter.dart';
import 'package:cryptovisor/screens/widgets/crypto_visor_checkbox_widget.dart';
import 'package:cryptovisor/screens/widgets/export_crypto_visor_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class DataAssetPage extends StatefulWidget {
  final CoinModel coinModel;

  const DataAssetPage({super.key, required this.coinModel});

  @override
  State<DataAssetPage> createState() => _DataAssetPageState();
}

class _DataAssetPageState extends State<DataAssetPage> with TickerProviderStateMixin {
  final DataAssetBloc _bloc = GetIt.I.get<DataAssetBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.getDataCoin(widget.coinModel.name);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataAssetBloc, DataAssetState>(
        bloc: _bloc,
        builder: (_, state) => Scaffold(
            backgroundColor: CryptoVisorColors.scaffoldColor,
            appBar: CryptoVisorAppBar(coinModel: widget.coinModel, onTap: () => context.pop()),
            body: ListView(padding: EdgeInsets.only(top: 16), children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("Contação atual: " + state.quotationValue).bodyBaseMedium(),
              ),
              Row(children: [
                CryptoVisorCheckboxWidget(
                    value: state.showBollinger, setValue: _bloc.setValueBollinger, title: "Bandas de Bollinger"),
                CryptoVisorCheckboxWidget(
                    value: state.showMovingAverage14, setValue: _bloc.setValueMovingAverage14, title: "Média movel 14")
              ]),
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8, right: 4),
                  child: Visibility(
                      visible: state.candles.isNotEmpty,
                      child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: 100),
                          duration: const Duration(seconds: 10),
                          builder: (BuildContext context, double percentage, Widget? widget) {
                            return SizedBox(
                                height: MediaQuery.sizeOf(context).width * 0.6,
                                width: MediaQuery.sizeOf(context).width,
                                child: CustomPaint(
                                    painter: CandleSticksChartPainter(
                                        movingAverageModel: state.movingAverage14,
                                        showBollinger: state.showBollinger,
                                        showMovingAverage14: state.showMovingAverage14,
                                        candles: state.candles,
                                        bollingerBandsModel: state.bollinger)));
                          }))),
              Visibility(
                  visible: state.candles.isNotEmpty && state.rsi.isNotEmpty,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 8, right: 4),
                      child: SizedBox(
                          height: MediaQuery.sizeOf(context).width * 0.6,
                          width: MediaQuery.sizeOf(context).width,
                          child: CustomPaint(
                              painter: RSIChartPainter(
                            candles: state.candles,
                            averages: state.rsi,
                          )))))
            ])));
  }
}
