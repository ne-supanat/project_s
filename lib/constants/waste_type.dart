import 'package:flutter/material.dart';

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
}
