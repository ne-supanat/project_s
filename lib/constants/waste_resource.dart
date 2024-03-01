import 'package:project_s/constants/waste_type.dart';
import 'package:project_s/models/waste_model.dart';
import 'package:project_s/resources/resources.dart';

class WasteNames {
  // GENERAL
  static const tissue = 'tissue';
  static const styrofoamPackaging = 'styrofoam_packaging';
  static const plasticCutlery = 'plastic_cutlery';
  static const chipsBag = 'chip_bag';
  static const toothpasteTubes = 'toothpaste_tubes';
  static const brokenToy = 'broken_toy';
  static const wornOutShoes = 'worn_out_shoes';
  static const brokenGlass = 'broken_glass';
  // ORGANIC
  static const appleCore = 'apple_core';
  static const bananaPeel = 'banana_peel';
  static const orangePeels = 'orange_peels';
  static const potatoPeels = 'potato_peels';
  static const eggShells = 'egg_shells';
  static const leaves = 'leaves';
  static const teaBag = 'tea_bag';
  // PAPER
  static const newspapers = 'newspaper';
  static const officePaper = 'office_paper';
  static const letter = 'letter';
  static const shreddedPaper = 'shredded_paper';
  static const book = 'book';
  static const cerealBox = 'cereal_box';
  static const tissueBox = 'tissue_box';
  // PLASTIC
  static const waterBottle = 'water_bottle';
  static const milkJug = 'milk_jug';
  static const shampooBottle = 'shampoo_bottle';
  static const sodaBottle = 'soda_bottle';
  static const juiceCarton = 'juice_carton';
  // ALUMINIUM
  static const foodCan = 'foodCan';
  static const sodaCan = 'soda_can';
  static const foil = 'foil';
  static const aluminiumPlate = 'aluminum_plate';
  static const aluminiumTrays = 'aluminum_trays';
  static const beerCan = 'beer_can';
  // GLASS
  static const glassBottleClear = 'glass_bottle_clear';
  static const glassBottleGreen = 'glass_bottle_green';
  static const glassBottleBrown = 'glass_bottle_brown';
  static const glassJarClear = 'glass_jarClear';
  static const glassJarGreen = 'glass_jar_green';
  static const glassJarBrown = 'glass_jar_brown';
  static const wineBottle = 'wine_bottle';
  static const jamJar = 'jam_jar';
  static const pickleJar = 'pickle_jar';
  // HAZARDOUS
  static const battery = 'battery';
  static const lightBulb = 'light_bulb';
  static const paintCan = 'paint_can';
  static const pesticide = 'pesticide';
  static const motorOil = 'motor_oil';
  static const sprayCan = 'spray_can';
  // ELECTRONIC
  static const mobilePhone = 'mobile_phone';
  static const tablet = 'tablet';
  static const laptop = 'laptop';
  static const monitor = 'monitor';
  static const keyboard = 'keyboard';
  static const mouse = 'mouse';
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

  final Map<String, WasteModel> wastes = {
    WasteNames.tissue: const WasteModel(
      imagePath: Images.imgTissue,
      name: 'Tissues',
      type: WasteType.general,
    ),
    WasteNames.styrofoamPackaging: const WasteModel(
      imagePath: Images.imgStyrofoam,
      name: 'Styrofoam Packaging',
      type: WasteType.general,
    ),
    WasteNames.plasticCutlery: const WasteModel(
      imagePath: Images.imgCutlery,
      name: 'Plastic Cutlery',
      type: WasteType.general,
    ),
    WasteNames.chipsBag: const WasteModel(
      imagePath: Images.imgChipsBag,
      name: 'Chips Bag',
      type: WasteType.general,
    ),
    WasteNames.toothpasteTubes: const WasteModel(
      imagePath: Images.imgToothPaste,
      name: 'Toothpaste Tube',
      type: WasteType.general,
    ),
    WasteNames.brokenToy: const WasteModel(
      imagePath: Images.imgBrokenToy,
      name: 'Broken Toy',
      type: WasteType.general,
    ),
    WasteNames.wornOutShoes: const WasteModel(
      imagePath: Images.imgWornOutShoes,
      name: 'Worn-Out Shoes',
      type: WasteType.general,
    ),
    WasteNames.brokenGlass: const WasteModel(
      imagePath: Images.imgBrokenGlass,
      name: 'Broken Glass',
      type: WasteType.general,
    ),
    WasteNames.appleCore: const WasteModel(
      imagePath: Images.imgAppleCore,
      name: 'Apple Core',
      type: WasteType.organic,
    ),
    WasteNames.bananaPeel: const WasteModel(
      imagePath: Images.imgBananaPeel,
      name: 'Banana Peel',
      type: WasteType.organic,
    ),
    WasteNames.orangePeels: const WasteModel(
      imagePath: Images.imgOrangePeel,
      name: 'Orange Peels',
      type: WasteType.organic,
    ),
    WasteNames.potatoPeels: const WasteModel(
      imagePath: Images.imgPotatoPeel,
      name: 'Potato Peels',
      type: WasteType.organic,
    ),
    WasteNames.eggShells: const WasteModel(
      imagePath: Images.imgEggShell,
      name: 'Egg Shells',
      type: WasteType.organic,
    ),
    WasteNames.leaves: const WasteModel(
      imagePath: Images.imgLeaves,
      name: 'Leaves',
      type: WasteType.organic,
    ),
    WasteNames.teaBag: const WasteModel(
      imagePath: Images.imgTeaBag,
      name: 'Tea Bag',
      type: WasteType.organic,
    ),
    WasteNames.newspapers: const WasteModel(
      imagePath: Images.imgNewsPaper,
      name: 'Newspapers',
      type: WasteType.paper,
    ),
    WasteNames.officePaper: const WasteModel(
      imagePath: Images.imgOfficePaper,
      name: 'Office Paper',
      type: WasteType.paper,
    ),
    WasteNames.letter: const WasteModel(
      imagePath: Images.imgLetter,
      name: 'Letter',
      type: WasteType.paper,
    ),
    WasteNames.shreddedPaper: const WasteModel(
      imagePath: Images.imgShreddedPaper,
      name: 'Shredded Paper',
      type: WasteType.paper,
    ),
    WasteNames.book: const WasteModel(
      imagePath: Images.imgBook,
      name: 'Book',
      type: WasteType.paper,
    ),
    WasteNames.cerealBox: const WasteModel(
      imagePath: Images.imgCerealBox,
      name: 'Cereal Box',
      type: WasteType.paper,
    ),
    WasteNames.tissueBox: const WasteModel(
      imagePath: Images.imgTissueBox,
      name: 'Tissue Box',
      type: WasteType.paper,
    ),
    WasteNames.waterBottle: const WasteModel(
      imagePath: Images.imgPlasticBottle,
      name: 'Water Bottle',
      type: WasteType.plastic,
    ),
    WasteNames.milkJug: const WasteModel(
      imagePath: Images.imgMilkJug,
      name: 'Milk Gallon',
      type: WasteType.plastic,
    ),
    WasteNames.shampooBottle: const WasteModel(
      imagePath: Images.imgShampoo,
      name: 'Shampoo Bottle',
      type: WasteType.plastic,
    ),
    WasteNames.sodaBottle: const WasteModel(
      imagePath: Images.imgSodaBottle,
      name: 'Soda Bottle',
      type: WasteType.plastic,
    ),
    WasteNames.juiceCarton: const WasteModel(
      imagePath: Images.imgJuiceCarton,
      name: 'Juice Carton',
      type: WasteType.plastic,
    ),
    WasteNames.foodCan: const WasteModel(
      imagePath: Images.imgFoodCan,
      name: 'Food Can',
      type: WasteType.aluminium,
    ),
    WasteNames.sodaCan: const WasteModel(
      imagePath: Images.imgSodaCan,
      name: 'Soda Can',
      type: WasteType.aluminium,
    ),
    WasteNames.foil: const WasteModel(
      imagePath: Images.imgFoil,
      name: 'Foil',
      type: WasteType.aluminium,
    ),
    WasteNames.aluminiumPlate: const WasteModel(
      imagePath: Images.imgAluminumPlate,
      name: 'Aluminum Plate',
      type: WasteType.aluminium,
    ),
    WasteNames.aluminiumTrays: const WasteModel(
      imagePath: Images.imgAluminumTray,
      name: 'Aluminum Tray',
      type: WasteType.aluminium,
    ),
    WasteNames.beerCan: const WasteModel(
      imagePath: Images.imgBeerCan,
      name: 'Beer Can',
      type: WasteType.aluminium,
    ),
    WasteNames.glassBottleClear: const WasteModel(
      imagePath: Images.imgGlassBottleClear,
      name: 'Glass Bottle(clear)',
      type: WasteType.glass,
    ),
    WasteNames.glassBottleGreen: const WasteModel(
      imagePath: Images.imgGlassBottleGreen,
      name: 'Glass Bottle(green)',
      type: WasteType.glass,
    ),
    WasteNames.glassBottleBrown: const WasteModel(
      imagePath: Images.imgGlassBottleBrown,
      name: 'Glass Bottle(brown)',
      type: WasteType.glass,
    ),
    WasteNames.glassJarClear: const WasteModel(
      imagePath: Images.imgGlassJarClear,
      name: 'Glass Jar(clear)',
      type: WasteType.glass,
    ),
    WasteNames.glassJarGreen: const WasteModel(
      imagePath: Images.imgGlassJarGreen,
      name: 'Glass Jar(green)',
      type: WasteType.glass,
    ),
    WasteNames.glassJarBrown: const WasteModel(
      imagePath: Images.imgGlassJarBrown,
      name: 'Glass Jar(brown)',
      type: WasteType.glass,
    ),
    WasteNames.wineBottle: const WasteModel(
      imagePath: Images.imgWine,
      name: 'Wine Bottle',
      type: WasteType.glass,
    ),
    WasteNames.jamJar: const WasteModel(
      imagePath: Images.imgJamJar,
      name: 'Jam Jar',
      type: WasteType.glass,
    ),
    WasteNames.pickleJar: const WasteModel(
      imagePath: Images.imgPickleJar,
      name: 'Pickle Jar',
      type: WasteType.glass,
    ),
    WasteNames.battery: const WasteModel(
      imagePath: Images.imgBattery,
      name: 'Battery',
      type: WasteType.hazardous,
    ),
    WasteNames.lightBulb: const WasteModel(
      imagePath: Images.imgLightBulb,
      name: 'Light Bulb',
      type: WasteType.hazardous,
    ),
    WasteNames.paintCan: const WasteModel(
      imagePath: Images.imgPaintCan,
      name: 'Paint Can',
      type: WasteType.hazardous,
    ),
    WasteNames.pesticide: const WasteModel(
      imagePath: Images.imgPesticide,
      name: 'Pesticide',
      type: WasteType.hazardous,
    ),
    WasteNames.motorOil: const WasteModel(
      imagePath: Images.imgMotorOil,
      name: 'Motor Oil',
      type: WasteType.hazardous,
    ),
    WasteNames.sprayCan: const WasteModel(
      imagePath: Images.imgSpayCan,
      name: 'Spray Can',
      type: WasteType.hazardous,
    ),
    WasteNames.mobilePhone: const WasteModel(
      imagePath: Images.imgMobilePhone,
      name: 'Mobile Phone',
      type: WasteType.electronic,
    ),
    WasteNames.tablet: const WasteModel(
      imagePath: Images.imgTablet,
      name: 'Tablet',
      type: WasteType.electronic,
    ),
    WasteNames.laptop: const WasteModel(
      imagePath: Images.imgLaptop,
      name: 'Laptop',
      type: WasteType.electronic,
    ),
    WasteNames.monitor: const WasteModel(
      imagePath: Images.imgMonitor,
      name: 'Monitor',
      type: WasteType.electronic,
    ),
    WasteNames.keyboard: const WasteModel(
      imagePath: Images.imgKeyboard,
      name: 'Keyboard',
      type: WasteType.electronic,
    ),
    WasteNames.mouse: const WasteModel(
      imagePath: Images.imgMouse,
      name: 'Mouse',
      type: WasteType.electronic,
    ),
  };
}
