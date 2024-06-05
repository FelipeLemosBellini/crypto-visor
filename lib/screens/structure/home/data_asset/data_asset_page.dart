import 'package:cryptovisor/core/entity/coin_model.dart';
import 'package:cryptovisor/core/entity/crypto_data/candle_data_entity.dart';
import 'package:cryptovisor/core/entity/response/response_data_crypto_and_bar_chart_model.dart';
import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:cryptovisor/screens/helper/export_helper_screen.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_bloc.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_state.dart';
import 'package:cryptovisor/screens/widgets/charts/candlestick/candlestick_chart_painter.dart';
import 'package:cryptovisor/screens/widgets/charts/rsi/line_chart_painter.dart';
import 'package:cryptovisor/screens/widgets/crypto_visor_switch_widget.dart';
import 'package:cryptovisor/screens/widgets/export_crypto_visor_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class DataAssetPage extends StatefulWidget {
  final CoinModel coinModel;
  final ResponseDataCryptoAndBarChartModel dataCryptoAndBarChartModel;
  final List<CandleDataEntity> listCandles;

  const DataAssetPage({
    super.key,
    required this.coinModel,
    required this.dataCryptoAndBarChartModel,
    required this.listCandles,
  });

  @override
  State<DataAssetPage> createState() => _DataAssetPageState();
}

class _DataAssetPageState extends State<DataAssetPage> with TickerProviderStateMixin {
  final DataAssetBloc _bloc = GetIt.I.get<DataAssetBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataAssetBloc, DataAssetState>(
        bloc: _bloc,
        builder: (_, state) => Scaffold(
            backgroundColor: CryptoVisorColors.scaffoldColor,
            appBar: CryptoVisorAppBar(coinModel: widget.coinModel, onTap: () => context.pop()),
            body: ListView(padding: const EdgeInsets.only(top: 16), children: [
              Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(children: [
                    const Text("Cotação atual: ").bodyBaseMedium(style: const TextStyle(color: Colors.white70)),
                    Text("${widget.dataCryptoAndBarChartModel.lastCloseValue} USD").bodyBaseMedium()
                  ])),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      margin: const EdgeInsets.only(left: 16, top: 8),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)), color: CryptoVisorColors.secondaryColor),
                      width: 80,
                      child: ButtonTheme(
                          alignedDropdown: true,
                          buttonColor: Colors.white,
                          child: DropdownButton<int>(
                              alignment: Alignment.center,
                              value: state.selectedValue,
                              elevation: 5,
                              enableFeedback: true,
                              iconEnabledColor: Colors.white,
                              style: const Text("").bodyBaseMedium().style,
                              dropdownColor: CryptoVisorColors.secondaryColor,
                              underline: const SizedBox.shrink(),
                              items: state.timers.map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(value: value, child: Text(value.toString()));
                              }).toList(),
                              onChanged: _bloc.setNewTimer)))),
              Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8, right: 4),
                  child: Visibility(
                      visible: widget.listCandles.isNotEmpty,
                      child: SizedBox(
                          height: MediaQuery.sizeOf(context).width * 0.6,
                          width: MediaQuery.sizeOf(context).width,
                          child: CustomPaint(
                              painter: CandleSticksChartPainter(
                                  movingAverageModel8: _bloc.subListaFinalGenerica(
                                      widget.dataCryptoAndBarChartModel.exponentialMovingAverageOf8days,
                                      state.amountCandles),
                                  movingAverageModel14: _bloc.subListaFinalGenerica(
                                      widget.dataCryptoAndBarChartModel.exponentialMovingAverageOf14days,
                                      state.amountCandles),
                                  movingAverageModel30: _bloc.subListaFinalGenerica(
                                      widget.dataCryptoAndBarChartModel.exponentialMovingAverageOf30days,
                                      state.amountCandles),
                                  candles: _bloc.subListaFinalGenerica(widget.listCandles, state.amountCandles),
                                  bollingerBandsModel: _bloc.subListaFinalGenerica(
                                      widget.dataCryptoAndBarChartModel.bollingerBands, state.amountCandles),
                                  showBollinger: state.showBollinger,
                                  showMovingAverage8: state.showMovingAverage8,
                                  showMovingAverage14: state.showMovingAverage14,
                                  showMovingAverage30: state.showMovingAverage30))))),
              Visibility(
                  visible: widget.listCandles.isNotEmpty &&
                      widget.dataCryptoAndBarChartModel.relativeStrengthIndex.isNotEmpty,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 40, left: 8, right: 4),
                      child: SizedBox(
                          height: MediaQuery.sizeOf(context).width * 0.6,
                          width: MediaQuery.sizeOf(context).width,
                          child: CustomPaint(
                              painter: RSIChartPainter(
                            candles: _bloc.subListaFinalGenerica(widget.listCandles, state.amountCandles),
                            averages: _bloc.subListaFinalGenerica(
                                widget.dataCryptoAndBarChartModel.relativeStrengthIndex, state.amountCandles),
                          ))))),
              Visibility(
                  visible: widget.listCandles.isNotEmpty,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(children: [
                        CryptoVisorSwitchWidget(
                            value: state.showBollinger,
                            setValue: _bloc.setValueBollinger,
                            title: "Bandas de Bollinger"),
                        CryptoVisorSwitchWidget(
                            value: state.showMovingAverage8,
                            setValue: _bloc.setValueMovingAverage8,
                            title: "Média movel 8"),
                        CryptoVisorSwitchWidget(
                            value: state.showMovingAverage14,
                            setValue: _bloc.setValueMovingAverage14,
                            title: "Média movel 14"),
                        CryptoVisorSwitchWidget(
                            value: state.showMovingAverage30,
                            setValue: _bloc.setValueMovingAverage30,
                            title: "Média movel 30")
                      ])))
            ])));
  }
}
