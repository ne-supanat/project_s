import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:project_s/resources/resources.dart';

void main() {
  test('translations assets test', () {
    expect(File(Translations.translation).existsSync(), isTrue);
  });
}
