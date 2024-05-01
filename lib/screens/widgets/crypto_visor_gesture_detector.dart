import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CryptoVisorGestureDetector extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  const CryptoVisorGestureDetector({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: child,
        onTapDown: (_) {
          HapticFeedback.lightImpact();
          onTap.call();
        });
  }
}
