import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:project_s/resources/resources.dart';

void main() {
  test('jsons assets test', () {
    expect(File(Jsons.wastes).existsSync(), isTrue);
  });
}
