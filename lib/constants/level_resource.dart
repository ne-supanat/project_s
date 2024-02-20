import 'package:project_s/constants/waste_resource.dart';
import 'package:project_s/constants/waste_type.dart';
import 'package:project_s/models/level_model.dart';

class LevelResource {
  final levels = {
    1: LevelModel(
      id: 1,
      availableCategories: [WasteCategory.general, WasteCategory.organic],
      wasteNames: [
        WasteNames.wasteGeneral,
        WasteNames.wasteFood,
      ],
    ),
    2: LevelModel(
      id: 2,
      availableCategories: [WasteCategory.recycle],
      wasteNames: [
        WasteNames.wastePaper,
        WasteNames.wastePlastic,
        WasteNames.wasteAluminium,
      ],
    ),
    3: LevelModel(
      id: 3,
      availableCategories: [WasteCategory.danger],
      wasteNames: [
        WasteNames.wasteBiohazard,
        WasteNames.wasteElectronic,
      ],
    ),
    4: LevelModel(
      id: 4,
      availableCategories: WasteCategory.values,
      wasteNames: [
        WasteNames.wasteGeneral,
        WasteNames.wasteFood,
        WasteNames.wastePaper,
        WasteNames.wastePlastic,
        WasteNames.wasteAluminium,
        WasteNames.wasteBiohazard,
        WasteNames.wasteElectronic,
      ],
    ),
  };
}
