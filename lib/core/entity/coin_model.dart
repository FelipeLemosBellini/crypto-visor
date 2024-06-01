import 'dart:convert';

import 'package:flutter/services.dart';

class CoinModel {
  final String name;
  final Uint8List base64Image;

  CoinModel({required this.name, required this.base64Image});

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    Uint8List imageBytes = base64.decode(map["base64Image"]);
    String name = map["name"];
    List<String> listLetters = name.split("");

    listLetters.first = listLetters.first.toUpperCase();

    return CoinModel(
      name: listLetters.join(),
      base64Image: imageBytes,
    );
  }
}
