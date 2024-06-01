import 'package:cryptovisor/screens/helper/export_helper_screen.dart';
import 'package:flutter/material.dart';

class CryptoVisorCheckboxWidget extends StatelessWidget {
  final bool value;
  final Function(bool?)? setValue;

  const CryptoVisorCheckboxWidget({super.key, required this.value, required this.setValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.zero,
        child: Row(children: [
          Checkbox.adaptive(
              value: value,
              onChanged: setValue,
              checkColor: CryptoVisorColors.red,
              overlayColor: MaterialStateProperty.resolveWith((Set states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xFFFFFFFF);
                } else {
                  return Color(0xFFFA0A0A);
                }
              }),
              fillColor: MaterialStateProperty.resolveWith((Set states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xFFEFEDED);
                } else {
                  return Color(0xFFD3D3D3);
                }
              })),
          Text("Bollinger Bands").bodyBaseLight()
        ]));
  }
}
