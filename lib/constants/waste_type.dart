import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../generated/l10n.dart';

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
        return Assets.images.icHazardous.path;
      case WasteType.electronic:
        return Assets.images.icElectronic.path;
      case WasteType.paper:
        return Assets.images.icPaper.path;
      case WasteType.plastic:
        return Assets.images.icPlastic.path;
      case WasteType.aluminium:
        return Assets.images.icAluminum.path;
      case WasteType.glass:
        return Assets.images.icGlass.path;
      case WasteType.organic:
        return Assets.images.icOrganic.path;
      case WasteType.general:
        return Assets.images.icGeneral.path;
    }
  }

  String string(context) {
    switch (this) {
      case WasteType.hazardous:
        return S.of(context).waste_type_biohazard_name;
      case WasteType.electronic:
        return S.of(context).waste_type_electronic_name;
      case WasteType.paper:
        return S.of(context).waste_type_paper_name;
      case WasteType.plastic:
        return S.of(context).waste_type_plastic_name;
      case WasteType.aluminium:
        return S.of(context).waste_type_aluminium_name;
      case WasteType.glass:
        return S.of(context).waste_type_glass_name;
      case WasteType.organic:
        return S.of(context).waste_type_food_name;
      case WasteType.general:
        return S.of(context).waste_type_general_name;
    }
  }

  String description(context) {
    switch (this) {
      case WasteType.hazardous:
        return S.of(context).waste_type_biohazard_description;
      case WasteType.electronic:
        return S.of(context).waste_type_electronic_description;
      case WasteType.paper:
        return S.of(context).waste_type_paper_description;
      case WasteType.plastic:
        return S.of(context).waste_type_plastic_description;
      case WasteType.aluminium:
        return S.of(context).waste_type_aluminium_description;
      case WasteType.glass:
        return S.of(context).waste_type_glass_description;
      case WasteType.organic:
        return S.of(context).waste_type_food_description;
      case WasteType.general:
        return S.of(context).waste_type_general_description;
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

  String string(context) {
    switch (this) {
      case WasteCategory.danger:
        return S.of(context).waste_category_hazardous;
      case WasteCategory.recycle:
        return S.of(context).waste_category_recyclable;
      case WasteCategory.general:
        return S.of(context).waste_category_common;
      case WasteCategory.organic:
        return S.of(context).waste_category_organic;
    }
  }
}
