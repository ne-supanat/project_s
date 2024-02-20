import 'package:project_s/constants/waste_type.dart';
import 'package:project_s/models/waste_model.dart';

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
    WasteNames.tissue: WasteModel(
      imagePath: '',
      name: 'Tissues',
      type: WasteType.general,
    ),
    WasteNames.styrofoamPackaging: WasteModel(
      imagePath: '',
      name: 'Styrofoam Packaging',
      type: WasteType.general,
    ),
    WasteNames.plasticCutlery: WasteModel(
      imagePath: '',
      name: 'Plastic Cutlery',
      type: WasteType.general,
    ),
    WasteNames.chipsBag: WasteModel(
      imagePath: '',
      name: 'Chips Bag',
      type: WasteType.general,
    ),
    WasteNames.toothpasteTubes: WasteModel(
      imagePath: '',
      name: 'Toothpaste Tube',
      type: WasteType.general,
    ),
    WasteNames.brokenToy: WasteModel(
      imagePath: '',
      name: 'Broken Toy',
      type: WasteType.general,
    ),
    WasteNames.wornOutShoes: WasteModel(
      imagePath: '',
      name: 'Worn-Out Shoes',
      type: WasteType.general,
    ),
    WasteNames.brokenGlass: WasteModel(
      imagePath: '',
      name: 'Broken Glass',
      type: WasteType.general,
    ),
    WasteNames.appleCore: WasteModel(
      imagePath: '',
      name: 'Apple Core',
      type: WasteType.organic,
    ),
    WasteNames.bananaPeel: WasteModel(
      imagePath: '',
      name: 'Banana Peel',
      type: WasteType.organic,
    ),
    WasteNames.orangePeels: WasteModel(
      imagePath: '',
      name: 'Orange Peels',
      type: WasteType.organic,
    ),
    WasteNames.potatoPeels: WasteModel(
      imagePath: '',
      name: 'Potato Peels',
      type: WasteType.organic,
    ),
    WasteNames.eggShells: WasteModel(
      imagePath: '',
      name: 'Egg Shells',
      type: WasteType.organic,
    ),
    WasteNames.leaves: WasteModel(
      imagePath: '',
      name: 'Leaves',
      type: WasteType.organic,
    ),
    WasteNames.teaBag: WasteModel(
      imagePath: '',
      name: 'Tea Bag',
      type: WasteType.organic,
    ),
    WasteNames.newspapers: WasteModel(
      imagePath: '',
      name: 'Newspapers',
      type: WasteType.paper,
    ),
    WasteNames.officePaper: WasteModel(
      imagePath: '',
      name: 'Office Paper',
      type: WasteType.paper,
    ),
    WasteNames.letter: WasteModel(
      imagePath: '',
      name: 'Letter',
      type: WasteType.paper,
    ),
    WasteNames.shreddedPaper: WasteModel(
      imagePath: '',
      name: 'Shredded Paper',
      type: WasteType.paper,
    ),
    WasteNames.book: WasteModel(
      imagePath: '',
      name: 'Book',
      type: WasteType.paper,
    ),
    WasteNames.cerealBox: WasteModel(
      imagePath: '',
      name: 'Cereal Box',
      type: WasteType.paper,
    ),
    WasteNames.tissueBox: WasteModel(
      imagePath: '',
      name: 'Tissue Box',
      type: WasteType.paper,
    ),
    WasteNames.waterBottle: WasteModel(
      imagePath: '',
      name: 'Water Bottle',
      type: WasteType.plastic,
    ),
    WasteNames.milkJug: WasteModel(
      imagePath: '',
      name: 'Milk Jug',
      type: WasteType.plastic,
    ),
    WasteNames.shampooBottle: WasteModel(
      imagePath: '',
      name: 'Shampoo Bottle',
      type: WasteType.plastic,
    ),
    WasteNames.sodaBottle: WasteModel(
      imagePath: '',
      name: 'Soda Bottle',
      type: WasteType.plastic,
    ),
    WasteNames.juiceCarton: WasteModel(
      imagePath: '',
      name: 'Juice Carton',
      type: WasteType.plastic,
    ),
    WasteNames.foodCan: WasteModel(
      imagePath: '',
      name: 'Food Can',
      type: WasteType.aluminium,
    ),
    WasteNames.sodaCan: WasteModel(
      imagePath: '',
      name: 'Soda Can',
      type: WasteType.aluminium,
    ),
    WasteNames.foil: WasteModel(
      imagePath: '',
      name: 'Foil',
      type: WasteType.aluminium,
    ),
    WasteNames.aluminiumPlate: WasteModel(
      imagePath: '',
      name: 'Aluminum Plate',
      type: WasteType.aluminium,
    ),
    WasteNames.aluminiumTrays: WasteModel(
      imagePath: '',
      name: 'Aluminum Trays',
      type: WasteType.aluminium,
    ),
    WasteNames.beerCan: WasteModel(
      imagePath: '',
      name: 'Beer Can',
      type: WasteType.aluminium,
    ),
    WasteNames.glassBottleClear: WasteModel(
      imagePath: '',
      name: 'Glass Bottle(clear)',
      type: WasteType.glass,
    ),
    WasteNames.glassBottleGreen: WasteModel(
      imagePath: '',
      name: 'Glass Bottle(green)',
      type: WasteType.glass,
    ),
    WasteNames.glassBottleBrown: WasteModel(
      imagePath: '',
      name: 'Glass Bottle(brown)',
      type: WasteType.glass,
    ),
    WasteNames.glassJarClear: WasteModel(
      imagePath: '',
      name: 'Glass Jar(clear)',
      type: WasteType.glass,
    ),
    WasteNames.glassJarGreen: WasteModel(
      imagePath: '',
      name: 'Glass Jar(green)',
      type: WasteType.glass,
    ),
    WasteNames.glassJarBrown: WasteModel(
      imagePath: '',
      name: 'Glass Jar(brown)',
      type: WasteType.glass,
    ),
    WasteNames.wineBottle: WasteModel(
      imagePath: '',
      name: 'Wine Bottle',
      type: WasteType.glass,
    ),
    WasteNames.jamJar: WasteModel(
      imagePath: '',
      name: 'Jam Jar',
      type: WasteType.glass,
    ),
    WasteNames.pickleJar: WasteModel(
      imagePath: '',
      name: 'Pickle Jar',
      type: WasteType.glass,
    ),
    WasteNames.battery: WasteModel(
      imagePath: '',
      name: 'Battery',
      type: WasteType.hazardous,
    ),
    WasteNames.lightBulb: WasteModel(
      imagePath: '',
      name: 'Light Bulb',
      type: WasteType.hazardous,
    ),
    WasteNames.paintCan: WasteModel(
      imagePath: '',
      name: 'Paint Can',
      type: WasteType.hazardous,
    ),
    WasteNames.pesticide: WasteModel(
      imagePath: '',
      name: 'Pesticide',
      type: WasteType.hazardous,
    ),
    WasteNames.motorOil: WasteModel(
      imagePath: '',
      name: 'Motor Oil',
      type: WasteType.hazardous,
    ),
    WasteNames.sprayCan: WasteModel(
      imagePath: '',
      name: 'Spray Can',
      type: WasteType.hazardous,
    ),
    WasteNames.mobilePhone: WasteModel(
      imagePath: '',
      name: 'Mobile Phone',
      type: WasteType.electronic,
    ),
    WasteNames.tablet: WasteModel(
      imagePath: '',
      name: 'Tablet',
      type: WasteType.electronic,
    ),
    WasteNames.laptop: WasteModel(
      imagePath: '',
      name: 'Laptop',
      type: WasteType.electronic,
    ),
    WasteNames.monitor: WasteModel(
      imagePath: '',
      name: 'Monitor',
      type: WasteType.electronic,
    ),
    WasteNames.keyboard: WasteModel(
      imagePath: '',
      name: 'Keyboard',
      type: WasteType.electronic,
    ),
    WasteNames.mouse: WasteModel(
      imagePath: '',
      name: 'Mouse',
      type: WasteType.electronic,
    ),
  };
}
