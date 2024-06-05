import 'package:cryptovisor/screens/helper/export_helper_screen.dart';
import 'package:cryptovisor/screens/widgets/crypto_visor_gesture_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoVisorSwitchWidget extends StatelessWidget {
  final bool value;
  final Function(bool) setValue;
  final String title;

  const CryptoVisorSwitchWidget({super.key, required this.value, required this.setValue, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.zero,
        child: Column(children: [
          const Divider(thickness: 2),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CryptoVisorGestureDetector(
                onTap: (){
                  setValue.call(!value);
                },
                child: Row(children: [
                  Text(title).bodyMediumRegular(),
                  const Spacer(),
                  CupertinoSwitch(
                      value: value,
                      onChanged: setValue,
                      activeColor: CryptoVisorColors.primaryColor,
                      thumbColor: Colors.white)
                ]),
              ))
        ]));
  }
}
