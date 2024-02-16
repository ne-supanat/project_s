enum WasteType { biohazard, electronic, paper, plastic, aluminium, food, general }

enum WasteCategory { danger, recycle, common }

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
