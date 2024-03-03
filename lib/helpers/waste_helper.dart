import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project_s/models/waste_model.dart';
import 'package:project_s/resources/resources.dart';

class WasteHelper {
  static Map<String, WasteModel> wastes = {};

  static Future<void> init() async {
    String jsonString = await rootBundle.loadString(Jsons.wastes);
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
