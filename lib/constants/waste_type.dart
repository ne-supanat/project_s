import 'package:flutter/material.dart';

import '../helpers/translations.dart';

enum WasteType { general, food, paper, plastic, aluminium, biohazard, electronic }

enum WasteCategory { common, recycle, danger }

extension WasteTypeExtension on WasteType {
  WasteCategory get category {
    switch (this) {
      case WasteType.biohazard:
      case WasteType.electronic:
        return WasteCategory.danger;
      case WasteType.paper:
      case WasteType.plastic:
      case WasteType.aluminium:
        return WasteCategory.recycle;
      case WasteType.food:
      case WasteType.general:
        return WasteCategory.common;
    }
  }

  String get icon {
    switch (this) {
      case WasteType.biohazard:
        return TranslationKeys.waste_type_biohazard_name;
      case WasteType.electronic:
        return TranslationKeys.waste_type_electronic_name;
      case WasteType.paper:
        return TranslationKeys.waste_type_paper_name;
      case WasteType.plastic:
        return TranslationKeys.waste_type_plastic_name;
      case WasteType.aluminium:
        return TranslationKeys.waste_type_aluminium_name;
      case WasteType.food:
        return TranslationKeys.waste_type_food_name;
      case WasteType.general:
        return TranslationKeys.waste_type_general_name;
    }
  }

  String get string {
    switch (this) {
      case WasteType.biohazard:
        return TranslationKeys.waste_type_biohazard_name;
      case WasteType.electronic:
        return TranslationKeys.waste_type_electronic_name;
      case WasteType.paper:
        return TranslationKeys.waste_type_paper_name;
      case WasteType.plastic:
        return TranslationKeys.waste_type_plastic_name;
      case WasteType.aluminium:
        return TranslationKeys.waste_type_aluminium_name;
      case WasteType.food:
        return TranslationKeys.waste_type_food_name;
      case WasteType.general:
        return TranslationKeys.waste_type_general_name;
    }
  }

  String get description {
    switch (this) {
      case WasteType.biohazard:
        return TranslationKeys.waste_type_biohazard_description;
      case WasteType.electronic:
        return TranslationKeys.waste_type_electronic_description;
      case WasteType.paper:
        return TranslationKeys.waste_type_paper_description;
      case WasteType.plastic:
        return TranslationKeys.waste_type_plastic_description;
      case WasteType.aluminium:
        return TranslationKeys.waste_type_aluminium_description;
      case WasteType.food:
        return TranslationKeys.waste_type_food_description;
      case WasteType.general:
        return TranslationKeys.waste_type_general_description;
    }
  }
}

extension WasteCategoryExtension on WasteCategory {
  Color get color {
    switch (this) {
      case WasteCategory.danger:
        return Colors.red;
      case WasteCategory.recycle:
        return Colors.blue;
      case WasteCategory.common:
        return Colors.green;
    }
  }

  String get string {
    switch (this) {
      case WasteCategory.danger:
        return TranslationKeys.waste_category_hazardous;
      case WasteCategory.recycle:
        return TranslationKeys.waste_category_recyclable;
      case WasteCategory.common:
        return TranslationKeys.waste_category_common;
    }
  }
}
