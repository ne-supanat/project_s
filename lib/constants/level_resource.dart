import '../models/level_model.dart';
import '../resources/waste_keys.dart';
import 'waste_type.dart';

class LevelResource {
  final levels = {
    1: LevelModel(
      id: 1,
      availableCategories: [WasteCategory.general, WasteCategory.organic],
      wasteNames: [
        WasteNames.tissue,
        WasteNames.plasticCutlery,
        WasteNames.chipsBag,
        WasteNames.appleCore,
        WasteNames.bananaPeel,
        WasteNames.eggShells,
      ],
    ),
    2: LevelModel(
      id: 2,
      availableCategories: [WasteCategory.recycle],
      wasteNames: [
        WasteNames.newspapers,
        WasteNames.letter,
        WasteNames.waterBottle,
        WasteNames.sodaBottle,
        WasteNames.sodaCan,
        WasteNames.foil,
        WasteNames.glassBottleClear,
        WasteNames.jamJar,
      ],
    ),
    3: LevelModel(
      id: 3,
      availableCategories: [WasteCategory.danger],
      wasteNames: [
        WasteNames.battery,
        WasteNames.lightBulb,
        WasteNames.tablet,
        WasteNames.monitor,
        WasteNames.mouse,
      ],
    ),
    4: LevelModel(
      id: 4,
      availableCategories: WasteCategory.values,
      wasteNames: [
        WasteNames.tissue,
        WasteNames.newspapers,
        WasteNames.sodaBottle,
        WasteNames.jamJar,
        WasteNames.battery,
        WasteNames.lightBulb,
        WasteNames.monitor,
        WasteNames.styrofoamPackaging,
        WasteNames.orangePeels,
        WasteNames.toothpasteTubes,
        WasteNames.aluminiumTrays,
        WasteNames.glassBottleBrown,
      ],
    ),
    5: LevelModel(
      id: 5,
      availableCategories: WasteCategory.values,
      wasteNames: [
        WasteNames.newspapers,
        WasteNames.sodaBottle,
        WasteNames.jamJar,
        WasteNames.lightBulb,
        WasteNames.styrofoamPackaging,
        WasteNames.toothpasteTubes,
        WasteNames.aluminiumTrays,
        WasteNames.glassJarClear,
        WasteNames.glassJarGreen,
        WasteNames.glassJarBrown,
        WasteNames.paintCan,
        WasteNames.pesticide,
        WasteNames.mobilePhone,
      ],
    ),
    6: LevelModel(
      id: 6,
      availableCategories: WasteCategory.values,
      wasteNames: [
        WasteNames.tissue,
        WasteNames.sodaBottle,
        WasteNames.battery,
        WasteNames.newspapers,
        WasteNames.pesticide,
        WasteNames.brokenToy,
        WasteNames.brokenGlass,
        WasteNames.potatoPeels,
        WasteNames.leaves,
        WasteNames.officePaper,
        WasteNames.shreddedPaper,
        WasteNames.book,
      ],
    ),
    7: LevelModel(
      id: 7,
      availableCategories: WasteCategory.values,
      wasteNames: [
        WasteNames.chipsBag,
        WasteNames.lightBulb,
        WasteNames.letter,
        WasteNames.orangePeels,
        WasteNames.glassJarClear,
        WasteNames.battery,
        WasteNames.potatoPeels,
        WasteNames.cerealBox,
        WasteNames.milkJug,
        WasteNames.shampooBottle,
        WasteNames.aluminiumPlate,
        WasteNames.beerCan,
      ],
    ),
    8: LevelModel(
      id: 8,
      availableCategories: WasteCategory.values,
      wasteNames: [
        WasteNames.lightBulb,
        WasteNames.sodaBottle,
        WasteNames.pesticide,
        WasteNames.potatoPeels,
        WasteNames.cerealBox,
        WasteNames.wornOutShoes,
        WasteNames.teaBag,
        WasteNames.tissueBox,
        WasteNames.juiceCarton,
        WasteNames.foodCan,
        WasteNames.glassBottleGreen,
        WasteNames.motorOil,
      ],
    ),
    9: LevelModel(
      id: 9,
      availableCategories: WasteCategory.values,
      wasteNames: [
        WasteNames.officePaper,
        WasteNames.shreddedPaper,
        WasteNames.lightBulb,
        WasteNames.letter,
        WasteNames.wornOutShoes,
        WasteNames.teaBag,
        WasteNames.foodCan,
        WasteNames.wineBottle,
        WasteNames.pickleJar,
        WasteNames.sprayCan,
        WasteNames.laptop,
        WasteNames.keyboard,
      ],
    ),
    10: LevelModel(
      id: 10,
      availableCategories: WasteCategory.values,
      wasteNames: [
        WasteNames.plasticCutlery,
        WasteNames.brokenGlass,
        WasteNames.eggShells,
        WasteNames.teaBag,
        WasteNames.letter,
        WasteNames.tissueBox,
        WasteNames.juiceCarton,
        WasteNames.foil,
        WasteNames.wineBottle,
        WasteNames.motorOil,
        WasteNames.sprayCan,
        WasteNames.mobilePhone,
      ],
    ),
  };
}
