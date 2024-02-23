import 'package:equatable/equatable.dart';
import 'package:project_s/constants/waste_type.dart';

class WasteModel extends Equatable {
  final String imagePath;
  final String name;
  final WasteType type;

  const WasteModel({
    required this.imagePath,
    required this.name,
    required this.type,
  });

  WasteCategory get category => type.category;

  @override
  List<Object?> get props => [
        imagePath,
        name,
        type,
      ];
}
