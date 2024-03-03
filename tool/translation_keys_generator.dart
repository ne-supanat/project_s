import 'dart:convert';
import 'dart:io';

class TranslationKeysGenerator {
  Future<void> generate({required String sourcePath, required String exportPath}) async {
    final jsonMap = await parseJsonFile(sourcePath);
    final generatedCode = generateKeysCode(jsonMap);
    await writeCodeToFile(generatedCode, exportPath);
  }

  Future<Map<String, dynamic>> parseJsonFile(String filePath) async {
    final file = File(filePath);
    final jsonString = await file.readAsString();
    return json.decode(jsonString);
  }

  String generateKeysCode(Map<String, dynamic> jsonMap) {
    final stringBuffer = StringBuffer();

    stringBuffer.writeln("// ignore_for_file: non_constant_identifier_names");
    stringBuffer.writeln();

    stringBuffer.writeln("import '../helpers/translation_helper.dart';");
    stringBuffer.writeln();

    stringBuffer.writeln('class TranslationKeys {');
    stringBuffer.writeln('\tstatic final translations = TranslationHelper.translations;');
    stringBuffer.writeln();

    writeChild(stringBuffer, [], jsonMap);

    stringBuffer.writeln('}');

    return stringBuffer.toString();
  }

  writeChild(StringBuffer stringBuffer, List<String> legacyKeys, dynamic value) {
    if (value is String) {
      stringBuffer.writeln(
          '\tstatic String get ${legacyKeys.reduce((value, element) => '${value}_$element')} => translations["${legacyKeys.join('"]["')}"];');
    } else {
      for (final key in (value as Map<String, dynamic>).keys) {
        writeChild(stringBuffer, legacyKeys..add(key), value[key]);
        legacyKeys.removeLast();
      }
    }
  }

  Future<void> writeCodeToFile(String code, String filePath) async {
    final file = await File(filePath).create(recursive: true);
    await file.writeAsString(code);
  }
}
