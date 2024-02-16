import 'package:project_s/constants/waste_type.dart';

class WasteModel {
  final String imagePath;
  final String name;
  final WasteType type;

  WasteModel({
    required this.imagePath,
    required this.name,
    required this.type,
  });

  WasteCategory get category => type.category;
}
