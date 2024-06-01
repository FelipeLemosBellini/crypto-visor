import 'package:cryptovisor/screens/widgets/export_crypto_visor_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cryptovisor/screens/helper/export_helper_screen.dart';

class CryptoVisorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String textTitle;
  final Function() onTap;

  const CryptoVisorAppBar({super.key, required this.textTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double heightTop = MediaQuery.paddingOf(context).top;
    return Container(
        height: 54 + heightTop,
        color: CryptoVisorColors.secondaryColor,
        padding: const EdgeInsets.only(left: 18),
        child: Padding(
            padding: EdgeInsets.only(top: heightTop),
            child: Row(children: [
              CryptoVisorGestureDetector(
                  onTap: onTap, child: const Icon(Icons.arrow_back, color: CryptoVisorColors.whiteLabel)),
              const SizedBox(width: 12),
              Text(textTitle, textAlign: TextAlign.center).bodyLargeSemiBold(style: const TextStyle(fontSize: 20))
            ])));
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
