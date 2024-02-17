import 'package:project_s/constants/waste_type.dart';

class LevelModel {
  final int id;
  final List<WasteCategory> availableCategories;
  final List<String> wasteNames;

  LevelModel({
    required this.id,
    required this.availableCategories,
    required this.wasteNames,
  });
}
