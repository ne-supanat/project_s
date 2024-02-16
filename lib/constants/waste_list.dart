import 'package:project_s/constants/waste_type.dart';
import 'package:project_s/models/waste_model.dart';

class WasteResource {
  get all => [
        wasteBiohazard,
        wasteElectronic,
        wastePaper,
        wastePlastic,
        wasteAluminium,
        wasteFood,
        wasteGeneral,
      ];

  final wasteBiohazard = WasteModel(
    imagePath: '',
    name: 'biohazard',
    type: WasteType.biohazard,
  );

  final wasteElectronic = WasteModel(
    imagePath: '',
    name: 'electronic',
    type: WasteType.electronic,
  );

  final wastePaper = WasteModel(
    imagePath: '',
    name: 'paper',
    type: WasteType.paper,
  );

  final wastePlastic = WasteModel(
    imagePath: '',
    name: 'plactic',
    type: WasteType.plastic,
  );

  final wasteAluminium = WasteModel(
    imagePath: '',
    name: 'aluminium',
    type: WasteType.aluminium,
  );

  final wasteFood = WasteModel(
    imagePath: '',
    name: 'food',
    type: WasteType.food,
  );

  final wasteGeneral = WasteModel(
    imagePath: '',
    name: 'general',
    type: WasteType.general,
  );
}
