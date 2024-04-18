import 'package:project_s/gen/assets.gen.dart';

import 'translation_keys_generator.dart';

Future<void> main() async {
  TranslationKeysGenerator().generate(
      sourcePath: Assets.jsons.translation, exportPath: 'lib/resources/translation_keys.dart');
}
