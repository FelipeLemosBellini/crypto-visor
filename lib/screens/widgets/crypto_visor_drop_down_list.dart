import 'package:flutter/material.dart';
import 'package:cryptovisor/screens/helper/export_helper_screen.dart';

class CryptoVisorDropDownList extends StatelessWidget {
  final List<String>? values;
  final String selectedValue;
  final String defaultValue;
  final ValueChanged<String?>? onChange;
  final bool isOnlyRead;

  const CryptoVisorDropDownList({
    super.key,
    this.values,
    required this.selectedValue,
    required this.defaultValue,
    this.onChange,
    required this.isOnlyRead,
  });

  String? _getValue() {
    var _hasValue = selectedValue.isEmpty;
    var firstValue = values != null && values!.isNotEmpty ? values?.first : defaultValue;
    return _hasValue ? firstValue : selectedValue;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36,
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            color: CryptoVisorColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            border: Border.all(color: CryptoVisorColors.white)),
        child: Visibility(
            visible: isOnlyRead,
            replacement: DropdownButton<String>(
                isExpanded: true,
                isDense: true,
                onChanged: onChange,
                underline: const SizedBox.shrink(),
                value: _getValue(),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                dropdownColor: CryptoVisorColors.white,
                iconSize: 20,
                elevation: 1,
                enableFeedback: true,
                icon: const Icon(Icons.keyboard_arrow_down_outlined, color: CryptoVisorColors.white),
                items: values
                    ?.map<DropdownMenuItem<String>>((String value) => DropdownMenuItem(
                        value: value,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(value).bodySmallRegular(),
                        )))
                    .toList()),
            child: Padding(padding: const EdgeInsets.only(right: 8), child: Text(selectedValue).bodySmallRegular())));
  }
}
