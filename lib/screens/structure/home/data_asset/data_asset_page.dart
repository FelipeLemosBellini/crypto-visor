import 'package:cryptovisor/routes/route_names.dart';
import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_bloc.dart';
import 'package:cryptovisor/screens/structure/home/data_asset/data_asset_state.dart';
import 'package:cryptovisor/screens/widgets/charts/candlestick/candlestick_chart_painter.dart';
import 'package:cryptovisor/screens/widgets/charts/rsi/line_chart_painter.dart';
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

class _DataAssetPageState extends State<DataAssetPage> with TickerProviderStateMixin {
  final DataAssetBloc _bloc = GetIt.I.get<DataAssetBloc>();
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    // _animation = CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn);
    _animation = Tween<double>(begin: 1.0, end: 2.0).animate(_animationController);

    WidgetsBinding.instance.addPostFrameCallback((_) => _animationController.forward(from: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataAssetBloc, DataAssetState>(
        bloc: _bloc,
        builder: (_, state) => Scaffold(
            backgroundColor: CryptoVisorColors.scaffoldColor,
            appBar: CryptoVisorAppBar(textTitle: widget.ticker, onTap: () => context.pop()),
            body: Column(children: [
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 4),
                  child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 100),
                      duration: const Duration(seconds: 10),
                      builder: (BuildContext context, double percentage, Widget? widget) {
                        return SizedBox(
                            height: 250,
                            width: MediaQuery.sizeOf(context).width,
                            child: CustomPaint(
                                painter: RSIChartPainter(
                              // percentage: percentage,
                              // animation: _animation,
                              averages: state.rsi,
                            )));
                      })),
              Padding(
                  padding: const EdgeInsets.only(top: 10,left: 8, right: 4),
                  child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 100),
                      duration: const Duration(seconds: 10),
                      builder: (BuildContext context, double percentage, Widget? widget) {
                        return SizedBox(
                            height: 250,
                            width: MediaQuery.sizeOf(context).width,
                            child: CustomPaint(painter: CandleSticksChartPainter(candles: state.candles)));
                      }))
            ])));
  }
}
