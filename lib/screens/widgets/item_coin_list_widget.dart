import 'package:cryptovisor/core/entity/coin_model.dart';
import 'package:cryptovisor/screens/helper/export_helper_screen.dart';
import 'package:flutter/material.dart';

class IconCoinListWidget extends StatelessWidget {
  final CoinModel coinModel;

  const IconCoinListWidget({super.key, required this.coinModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Image.memory(coinModel.base64Image),
          ),
          const SizedBox(width: 8),
          Text(coinModel.name).bodyBaseMedium()
        ]));
  }
}
