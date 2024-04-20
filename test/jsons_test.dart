import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:project_s/generated/assets.gen.dart';

void main() {
  test('jsons assets test', () {
    expect(File(Assets.jsons.wastes).existsSync(), isTrue);
  });
}
