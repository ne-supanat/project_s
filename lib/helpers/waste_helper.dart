import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project_s/gen/assets.gen.dart';
import 'package:project_s/models/waste_model.dart';

class WasteHelper {
  static Map<String, WasteModel> wastes = {};

  static Future<void> init() async {
    String jsonString = await rootBundle.loadString(Assets.jsons.wastes);
    final Map<String, dynamic> json = jsonDecode(jsonString);

    wastes = json.map((key, value) => MapEntry(key, WasteModel.fromJson(value)));
  }

  List<WasteModel> get all => wastes.values.toList();

  List<WasteModel> getWasteFromNames(List<String> names) {
    final result = <WasteModel>[];
    for (final name in names) {
      final waste = wastes[name];
      if (waste != null) {
        result.add(waste);
      }
    }

    return result;
  }
}
