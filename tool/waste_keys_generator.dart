import 'dart:convert';
import 'dart:io';

class WasteKeysGenerator {
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
    final keys = jsonMap.keys.toList();
    final stringBuffer = StringBuffer();

    stringBuffer.writeln('class WasteNames {');

    for (final key in keys) {
      stringBuffer.writeln('\tstatic const $key = "$key";');
    }

    stringBuffer.writeln('}');

    return stringBuffer.toString();
  }

  Future<void> writeCodeToFile(String code, String filePath) async {
    final file = await File(filePath).create(recursive: true);
    await file.writeAsString(code);
  }
}
