import 'dart:convert';

import 'package:flutter/services.dart';

class CoinModel {
  final String name;
  final Uint8List base64Image;

  CoinModel({required this.name, required this.base64Image});

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    Uint8List imageBytes = base64.decode(map["base64Image"]);
    return CoinModel(
      name: map["name"],
      base64Image: imageBytes,
    );
  }
}
