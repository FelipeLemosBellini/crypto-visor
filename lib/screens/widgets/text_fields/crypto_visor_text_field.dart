import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cryptovisor/screens/helper/crypto_visor_colors.dart';
import 'package:cryptovisor/screens/helper/style_text/crypto_visor_typography.dart';

class ScienceDexTextField extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool? readOnly;
  final TextInputType? textInputType;
  final int? maxLines;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final EdgeInsets? padding;
  final String? labelText;
  final Function()? opTapOutSide;
  final TextInputAction? textInputAction;

  const ScienceDexTextField({
    super.key,
    this.padding,
    required this.controller,
    this.readOnly,
    this.textInputType,
    this.maxLines = 1,
    this.onChanged,
    this.onSubmitted,
    required this.focusNode,
    this.labelText,
    this.opTapOutSide,
    this.textInputAction,
  });

  @override
  State<ScienceDexTextField> createState() => _ScienceDexTextFieldState();
}

class _ScienceDexTextFieldState extends State<ScienceDexTextField> {
  TextStyle get _labelTextStyle =>
      const Text("").bodySmallMedium(style: const TextStyle(color: CryptoVisorColors.label)).style!;

  TextStyle get _defaultTextStyle => const Text("").bodySmallMedium().style!;

  OutlineInputBorder get _border => OutlineInputBorder(
      borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: Colors.transparent));

  OutlineInputBorder get _defaultFocusedBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(5), borderSide: const BorderSide(color: CryptoVisorColors.gray, width: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 39.0,
        padding: widget.padding ?? EdgeInsets.zero,
        alignment: Alignment.center,
        child: TextField(
            cursorHeight: 13,
            keyboardAppearance: Brightness.light,
            controller: widget.controller,
            readOnly: widget.readOnly ?? false,
            style: _defaultTextStyle,
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
            onTapOutside: (_) {
              widget.opTapOutSide != null ? widget.opTapOutSide?.call() : widget.focusNode.unfocus();
            },
            onSubmitted: widget.onSubmitted,
            onChanged: widget.onChanged,
            maxLines: widget.maxLines,
            keyboardType: widget.textInputType,
            cursorColor: CryptoVisorColors.secondaryColor,
            decoration: InputDecoration(
                filled: true,
                isCollapsed: false,
                constraints: const BoxConstraints.expand(height: 39),
                fillColor: CryptoVisorColors.grayLight,
                enabledBorder: _border,
                labelText: widget.labelText,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: widget.readOnly == false ? _defaultFocusedBorder : _border,
                labelStyle: _labelTextStyle)));
  }
}
