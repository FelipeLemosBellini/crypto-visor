import 'package:cryptovisor/screens/widgets/export_crypto_visor_material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cryptovisor/screens/helper/export_helper_screen.dart';

class CryptoVisorTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String textTitle;

  const CryptoVisorTitleAppBar({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    double heightTop = MediaQuery.paddingOf(context).top;
    return Container(
        height: 54 + heightTop,
        color: CryptoVisorColors.secondaryColor,
        child: Padding(
            padding: EdgeInsets.only(top: heightTop + 10),
            child:
                Text(textTitle, textAlign: TextAlign.center).bodyLargeSemiBold(style: const TextStyle(fontSize: 20))));
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
