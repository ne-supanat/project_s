import 'package:flutter/material.dart';

import '../generated/assets.gen.dart';
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

  String get string => S.current.waste_type_name(this);
  String get description => S.current.waste_type_description(this);
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

  String get string => S.current.waste_category_name(this);
}
