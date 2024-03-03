import 'package:project_s/resources/resources.dart';

import 'translation_keys_generator.dart';
import 'waste_keys_generator.dart';

Future<void> main() async {
  WasteKeysGenerator()
      .generate(sourcePath: Jsons.wastes, exportPath: 'lib/resources/waste_keys.dart');
  TranslationKeysGenerator()
      .generate(sourcePath: Jsons.translation, exportPath: 'lib/resources/translation_keys.dart');
}
