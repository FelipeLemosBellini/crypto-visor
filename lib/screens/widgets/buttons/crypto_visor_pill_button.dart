import 'package:cryptovisor/screens/helper/export_helper_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScienceDexPillButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final EdgeInsets? padding;
  final Alignment? alignment;
  final Color? backgroundColor;

  const ScienceDexPillButton({
    super.key,
    required this.onTap,
    required this.text,
    this.padding,
    this.alignment,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment ?? Alignment.center,
        padding: padding ?? EdgeInsets.zero,
        child: MaterialButton(
            height: 30,
            minWidth: 89,
            padding: EdgeInsets.zero,
            elevation: 0,
            enableFeedback: true,
            onPressed: onTap,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: backgroundColor ?? CryptoVisorColors.secondaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 8),
              child: Text(text).bodyBaseMedium(style: const TextStyle(color: CryptoVisorColors.white)),
            )));
  }
}
