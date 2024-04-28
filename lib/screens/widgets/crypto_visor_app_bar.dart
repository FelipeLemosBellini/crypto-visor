import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cryptovisor/screens/helper/export_helper_screen.dart';

class ScienceDexAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String textTitle;

  ScienceDexAppBar({required this.textTitle}) : super();

  @override
  Widget build(BuildContext context) {
    double heightTop = MediaQuery.paddingOf(context).top;
    return Container(
        height: 54 + heightTop,
        color: CryptoVisorColors.scaffoldBackground,
        padding: const EdgeInsets.only(left: 18),
        child: Column(children: [
          const Spacer(),
          Row(children: [
            SvgPicture.asset(ScienceDexVector.arrow_back.svg, height: 45),
            Text(textTitle).bodyLargeSemiBold(style: const TextStyle(fontSize: 24)),
          ])
        ]));
  }

  @override
  Size get preferredSize => const Size.fromHeight(200);
}
