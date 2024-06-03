import 'package:cryptovisor/screens/helper/export_helper_screen.dart';
import 'package:flutter/material.dart';

class CryptoVisorCheckboxWidget extends StatelessWidget {
  final bool value;
  final Function(bool?)? setValue;
  final String title;

  const CryptoVisorCheckboxWidget({super.key, required this.value, required this.setValue, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.zero,
        child: Row(children: [
          Checkbox(
              value: value,
              onChanged: setValue,
              checkColor: CryptoVisorColors.white,
              overlayColor: MaterialStateProperty.resolveWith((Set states) {
                if (states.contains(MaterialState.selected)) {
                  return CryptoVisorColors.primaryColor;
                } else {
                  return CryptoVisorColors.primaryColor;
                }
              }),
              fillColor: MaterialStateProperty.resolveWith((Set states) {
                if (states.contains(MaterialState.selected)) {
                  return CryptoVisorColors.primaryColor;
                } else {
                  return CryptoVisorColors.whiteLabel;
                }
              })),
          Text(title).bodyBaseLight()
        ]));
  }
}
