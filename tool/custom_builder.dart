import 'package:project_s/resources/resources.dart';

import 'waste_keys_generator.dart';

Future<void> main() async {
  WasteKeysGenerator().generate(sourcePath: Jsons.wastes, exportPath: 'lib/resources/wastes.dart');
}
