// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:project_s/resources/resources.dart';

class TranslationHelper {
  TranslationHelper._();

  static Map<String, dynamic> translations = {};

  static Future<void> init() async {
    String jsonString = await rootBundle.loadString(Translations.translation);
    translations = jsonDecode(jsonString);
  }
}
