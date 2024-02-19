import 'package:project_s/constants/waste_type.dart';
import 'package:project_s/models/waste_model.dart';

class WasteNames {
  static const wasteBiohazard = 'biohazard';
  static const wasteElectronic = 'electronic';
  static const wastePaper = 'paper';
  static const wastePlastic = 'plactic';
  static const wasteAluminium = 'aluminium';
  static const wasteFood = 'food';
  static const wasteGeneral = 'general';
}

class WasteResource {
  List<WasteModel> get all => wastes.values.toList();

  List<WasteModel> getWasteFromNames(List<String> names) {
    final result = <WasteModel>[];
    for (final name in names) {
      final waste = wastes[name];
      if (waste != null) {
        result.add(waste);
      }
    }

    return result;
  }

  final wastes = {
    WasteNames.wasteBiohazard: WasteModel(
      imagePath: 'https://picsum.photos/100',
      name: 'biohazard',
      type: WasteType.biohazard,
    ),
    WasteNames.wasteElectronic: WasteModel(
      imagePath: 'https://picsum.photos/200',
      name: 'electronic',
      type: WasteType.electronic,
    ),
    WasteNames.wastePaper: WasteModel(
      imagePath: 'https://picsum.photos/300',
      name: 'paper',
      type: WasteType.paper,
    ),
    WasteNames.wastePlastic: WasteModel(
      imagePath: 'https://picsum.photos/400',
      name: 'plactic',
      type: WasteType.plastic,
    ),
    WasteNames.wasteAluminium: WasteModel(
      imagePath: 'https://picsum.photos/500',
      name: 'aluminium',
      type: WasteType.aluminium,
    ),
    WasteNames.wasteFood: WasteModel(
      imagePath: 'https://picsum.photos/600',
      name: 'food',
      type: WasteType.food,
    ),
    WasteNames.wasteGeneral: WasteModel(
      imagePath: 'https://picsum.photos/700',
      name: 'general',
      type: WasteType.general,
    ),
  };
}
