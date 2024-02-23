import 'package:project_s/constants/waste_type.dart';
import 'package:project_s/models/waste_model.dart';
import 'package:project_s/resources/resources.dart';

class WasteNames {
  // GENERAL 8
  static const tissue = 'tissue';
  static const styrofoamPackaging = 'styrofoam_packaging';
  static const plasticCutlery = 'plastic_cutlery';
  static const chipsBag = 'chip_bag';
  static const toothpasteTubes = 'toothpaste_tubes';
  static const brokenToy = 'broken_toy';
  static const wornOutShoes = 'worn_out_shoes';
  static const brokenGlass = 'broken_glass';
  // ORGANIC 7
  static const appleCore = 'apple_core';
  static const bananaPeel = 'banana_peel';
  static const orangePeels = 'orange_peels';
  static const potatoPeels = 'potato_peels';
  static const eggShells = 'egg_shells';
  static const leaves = 'leaves';
  static const teaBag = 'tea_bag';
  // PAPER 7
  static const newspapers = 'newspaper';
  static const officePaper = 'office_paper';
  static const letter = 'letter';
  static const shreddedPaper = 'shredded_paper';
  static const book = 'book';
  static const cerealBox = 'cereal_box';
  static const tissueBox = 'tissue_box';
  // PLASTIC 37-5
  static const waterBottle = 'water_bottle';
  static const milkJug = 'milk_jug';
  static const shampooBottle = 'shampoo_bottle';
  static const sodaBottle = 'soda_bottle';
  static const juiceCarton = 'juice_carton';
  // ALUMINIUM 32-6
  static const foodCan = 'foodCan';
  static const sodaCan = 'soda_can';
  static const foil = 'foil';
  static const aluminiumPlate = 'aluminum_plate';
  static const aluminiumTrays = 'aluminum_trays';
  static const beerCan = 'beer_can';
  // GLASS 26-9
  static const glassBottleClear = 'glass_bottle_clear';
  static const glassBottleGreen = 'glass_bottle_green';
  static const glassBottleBrown = 'glass_bottle_brown';
  static const glassJarClear = 'glass_jarClear';
  static const glassJarGreen = 'glass_jar_green';
  static const glassJarBrown = 'glass_jar_brown';
  static const wineBottle = 'wine_bottle';
  static const jamJar = 'jam_jar';
  static const pickleJar = 'pickle_jar';
  // HAZARDOUS 17-6
  static const battery = 'battery';
  static const lightBulb = 'light_bulb';
  static const paintCan = 'paint_can';
  static const pesticide = 'pesticide';
  static const motorOil = 'motor_oil';
  static const sprayCan = 'spray_can';
  // ELECTRONIC-6
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
    WasteNames.tissue: WasteModel(
      imagePath: Images.imgTissue,
      name: 'Tissues',
      type: WasteType.general,
    ),
    WasteNames.styrofoamPackaging: WasteModel(
      imagePath: Images.imgStyrofoam,
      name: 'Styrofoam Packaging',
      type: WasteType.general,
    ),
    WasteNames.plasticCutlery: WasteModel(
      imagePath: Images.imgCutlery,
      name: 'Plastic Cutlery',
      type: WasteType.general,
    ),
    WasteNames.chipsBag: WasteModel(
      imagePath: Images.imgChipsBag,
      name: 'Chips Bag',
      type: WasteType.general,
    ),
    WasteNames.toothpasteTubes: WasteModel(
      imagePath: Images.imgToothPaste,
      name: 'Toothpaste Tube',
      type: WasteType.general,
    ),
    WasteNames.brokenToy: WasteModel(
      imagePath: Images.imgBrokenToy,
      name: 'Broken Toy',
      type: WasteType.general,
    ),
    WasteNames.wornOutShoes: WasteModel(
      imagePath: Images.imgWornOutShoes,
      name: 'Worn-Out Shoes',
      type: WasteType.general,
    ),
    WasteNames.brokenGlass: WasteModel(
      imagePath: Images.imgBrokenGlass,
      name: 'Broken Glass',
      type: WasteType.general,
    ),
    WasteNames.appleCore: WasteModel(
      imagePath: Images.imgAppleCore,
      name: 'Apple Core',
      type: WasteType.organic,
    ),
    WasteNames.bananaPeel: WasteModel(
      imagePath: Images.imgBananaPeel,
      name: 'Banana Peel',
      type: WasteType.organic,
    ),
    WasteNames.orangePeels: WasteModel(
      imagePath: Images.imgOrangePeel,
      name: 'Orange Peels',
      type: WasteType.organic,
    ),
    WasteNames.potatoPeels: WasteModel(
      imagePath: Images.imgPotatoPeel,
      name: 'Potato Peels',
      type: WasteType.organic,
    ),
    WasteNames.eggShells: WasteModel(
      imagePath: Images.imgEggShell,
      name: 'Egg Shells',
      type: WasteType.organic,
    ),
    WasteNames.leaves: WasteModel(
      imagePath: Images.imgLeaves,
      name: 'Leaves',
      type: WasteType.organic,
    ),
    WasteNames.teaBag: WasteModel(
      imagePath: Images.imgTeaBag,
      name: 'Tea Bag',
      type: WasteType.organic,
    ),
    WasteNames.newspapers: WasteModel(
      imagePath: Images.imgNewsPaper,
      name: 'Newspapers',
      type: WasteType.paper,
    ),
    WasteNames.officePaper: WasteModel(
      imagePath: Images.imgOfficePaper,
      name: 'Office Paper',
      type: WasteType.paper,
    ),
    WasteNames.letter: WasteModel(
      imagePath: Images.imgLetter,
      name: 'Letter',
      type: WasteType.paper,
    ),
    WasteNames.shreddedPaper: WasteModel(
      imagePath: Images.imgShreddedPaper,
      name: 'Shredded Paper',
      type: WasteType.paper,
    ),
    WasteNames.book: WasteModel(
      imagePath: Images.imgBook,
      name: 'Book',
      type: WasteType.paper,
    ),
    WasteNames.cerealBox: WasteModel(
      imagePath: Images.imgCerealBox,
      name: 'Cereal Box',
      type: WasteType.paper,
    ),
    WasteNames.tissueBox: WasteModel(
      imagePath: Images.imgTissueBox,
      name: 'Tissue Box',
      type: WasteType.paper,
    ),
    WasteNames.waterBottle: WasteModel(
      imagePath: Images.imgPlasticBottle,
      name: 'Water Bottle',
      type: WasteType.plastic,
    ),
    WasteNames.milkJug: WasteModel(
      imagePath: Images.imgMilkJug,
      name: 'Milk Jug',
      type: WasteType.plastic,
    ),
    WasteNames.shampooBottle: WasteModel(
      imagePath: Images.imgShampoo,
      name: 'Shampoo Bottle',
      type: WasteType.plastic,
    ),
    WasteNames.sodaBottle: WasteModel(
      imagePath: Images.imgSodaBottle,
      name: 'Soda Bottle',
      type: WasteType.plastic,
    ),
    WasteNames.juiceCarton: WasteModel(
      imagePath: Images.imgJuiceCarton,
      name: 'Juice Carton',
      type: WasteType.plastic,
    ),
    WasteNames.foodCan: WasteModel(
      imagePath: Images.imgFoodCan,
      name: 'Food Can',
      type: WasteType.aluminium,
    ),
    WasteNames.sodaCan: WasteModel(
      imagePath: Images.imgSodaCan,
      name: 'Soda Can',
      type: WasteType.aluminium,
    ),
    WasteNames.foil: WasteModel(
      imagePath: Images.imgFoil,
      name: 'Foil',
      type: WasteType.aluminium,
    ),
    WasteNames.aluminiumPlate: WasteModel(
      imagePath: Images.imgAluminumPlate,
      name: 'Aluminum Plate',
      type: WasteType.aluminium,
    ),
    WasteNames.aluminiumTrays: WasteModel(
      imagePath: Images.imgAluminumTray,
      name: 'Aluminum Tray',
      type: WasteType.aluminium,
    ),
    WasteNames.beerCan: WasteModel(
      imagePath: Images.imgBeerCan,
      name: 'Beer Can',
      type: WasteType.aluminium,
    ),
    WasteNames.glassBottleClear: WasteModel(
      imagePath: Images.imgGlassBottleClear,
      name: 'Glass Bottle(clear)',
      type: WasteType.glass,
    ),
    WasteNames.glassBottleGreen: WasteModel(
      imagePath: Images.imgGlassBottleGreen,
      name: 'Glass Bottle(green)',
      type: WasteType.glass,
    ),
    WasteNames.glassBottleBrown: WasteModel(
      imagePath: Images.imgGlassBottleBrown,
      name: 'Glass Bottle(brown)',
      type: WasteType.glass,
    ),
    WasteNames.glassJarClear: WasteModel(
      imagePath: Images.imgGlassJarClear,
      name: 'Glass Jar(clear)',
      type: WasteType.glass,
    ),
    WasteNames.glassJarGreen: WasteModel(
      imagePath: Images.imgGlassJarGreen,
      name: 'Glass Jar(green)',
      type: WasteType.glass,
    ),
    WasteNames.glassJarBrown: WasteModel(
      imagePath: Images.imgGlassJarBrown,
      name: 'Glass Jar(brown)',
      type: WasteType.glass,
    ),
    WasteNames.wineBottle: WasteModel(
      imagePath: Images.imgWine,
      name: 'Wine Bottle',
      type: WasteType.glass,
    ),
    WasteNames.jamJar: WasteModel(
      imagePath: Images.imgJamJar,
      name: 'Jam Jar',
      type: WasteType.glass,
    ),
    WasteNames.pickleJar: WasteModel(
      imagePath: Images.imgPickleJar,
      name: 'Pickle Jar',
      type: WasteType.glass,
    ),
    WasteNames.battery: WasteModel(
      imagePath: Images.imgBattery,
      name: 'Battery',
      type: WasteType.hazardous,
    ),
    WasteNames.lightBulb: WasteModel(
      imagePath: Images.imgLightBulb,
      name: 'Light Bulb',
      type: WasteType.hazardous,
    ),
    WasteNames.paintCan: WasteModel(
      imagePath: Images.imgPaintCan,
      name: 'Paint Can',
      type: WasteType.hazardous,
    ),
    WasteNames.pesticide: WasteModel(
      imagePath: Images.imgPesticide,
      name: 'Pesticide',
      type: WasteType.hazardous,
    ),
    WasteNames.motorOil: WasteModel(
      imagePath: Images.imgMotorOil,
      name: 'Motor Oil',
      type: WasteType.hazardous,
    ),
    WasteNames.sprayCan: WasteModel(
      imagePath: Images.imgSpayCan,
      name: 'Spray Can',
      type: WasteType.hazardous,
    ),
    WasteNames.mobilePhone: WasteModel(
      imagePath: Images.imgMobilePhone,
      name: 'Mobile Phone',
      type: WasteType.electronic,
    ),
    WasteNames.tablet: WasteModel(
      imagePath: Images.imgTablet,
      name: 'Tablet',
      type: WasteType.electronic,
    ),
    WasteNames.laptop: WasteModel(
      imagePath: Images.imgLaptop,
      name: 'Laptop',
      type: WasteType.electronic,
    ),
    WasteNames.monitor: WasteModel(
      imagePath: Images.imgMonitor,
      name: 'Monitor',
      type: WasteType.electronic,
    ),
    WasteNames.keyboard: WasteModel(
      imagePath: Images.imgKeyboard,
      name: 'Keyboard',
      type: WasteType.electronic,
    ),
    WasteNames.mouse: WasteModel(
      imagePath: Images.imgMouse,
      name: 'Mouse',
      type: WasteType.electronic,
    ),
  };
}
