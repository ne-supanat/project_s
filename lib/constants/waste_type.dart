import 'package:flutter/material.dart';

import '../helpers/translations.dart';
import '../resources/resources.dart';

enum WasteType { general, organic, paper, plastic, aluminium, glass, hazardous, electronic }

enum WasteCategory { general, organic, recycle, danger }

WasteType getWasteType(string) {
  return WasteType.values.firstWhere((element) => element.name == string);
}

extension WasteTypeExtension on WasteType {
  WasteCategory get category {
    switch (this) {
      case WasteType.hazardous:
      case WasteType.electronic:
        return WasteCategory.danger;
      case WasteType.paper:
      case WasteType.plastic:
      case WasteType.aluminium:
      case WasteType.glass:
        return WasteCategory.recycle;
      case WasteType.organic:
        return WasteCategory.organic;
      case WasteType.general:
        return WasteCategory.general;
    }
  }

  String get icon {
    switch (this) {
      case WasteType.hazardous:
        return Images.icHazardous;
      case WasteType.electronic:
        return Images.icElectronic;
      case WasteType.paper:
        return Images.icPaper;
      case WasteType.plastic:
        return Images.icPlastic;
      case WasteType.aluminium:
        return Images.icAluminum;
      case WasteType.glass:
        return Images.icGlass;
      case WasteType.organic:
        return Images.icOrganic;
      case WasteType.general:
        return Images.icGeneral;
    }
  }

  String get string {
    switch (this) {
      case WasteType.hazardous:
        return TranslationKeys.waste_type_biohazard_name;
      case WasteType.electronic:
        return TranslationKeys.waste_type_electronic_name;
      case WasteType.paper:
        return TranslationKeys.waste_type_paper_name;
      case WasteType.plastic:
        return TranslationKeys.waste_type_plastic_name;
      case WasteType.aluminium:
        return TranslationKeys.waste_type_aluminium_name;
      case WasteType.glass:
        return TranslationKeys.waste_type_glass_name;
      case WasteType.organic:
        return TranslationKeys.waste_type_food_name;
      case WasteType.general:
        return TranslationKeys.waste_type_general_name;
    }
  }

  String get description {
    switch (this) {
      case WasteType.hazardous:
        return TranslationKeys.waste_type_biohazard_description;
      case WasteType.electronic:
        return TranslationKeys.waste_type_electronic_description;
      case WasteType.paper:
        return TranslationKeys.waste_type_paper_description;
      case WasteType.plastic:
        return TranslationKeys.waste_type_plastic_description;
      case WasteType.aluminium:
        return TranslationKeys.waste_type_aluminium_description;
      case WasteType.glass:
        return TranslationKeys.waste_type_glass_description;
      case WasteType.organic:
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
      case WasteCategory.general:
        return Colors.blueGrey;
      case WasteCategory.organic:
        return Colors.green;
    }
  }

  String get string {
    switch (this) {
      case WasteCategory.danger:
        return TranslationKeys.waste_category_hazardous;
      case WasteCategory.recycle:
        return TranslationKeys.waste_category_recyclable;
      case WasteCategory.general:
        return TranslationKeys.waste_category_common;
      case WasteCategory.organic:
        return TranslationKeys.waste_category_organic;
    }
  }
}
