import 'package:equatable/equatable.dart';

import '../constants/waste_type.dart';

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

  factory WasteModel.fromJson(Map<String, dynamic> json) {
    return WasteModel(
      imagePath: json['image'],
      name: json['name'],
      type: getWasteType(json['type']),
    );
  }

  @override
  List<Object?> get props => [
        imagePath,
        name,
        type,
      ];
}
