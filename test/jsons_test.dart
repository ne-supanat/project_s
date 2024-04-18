import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:project_s/gen/assets.gen.dart';

void main() {
  test('jsons assets test', () {
    expect(File(Assets.jsons.translation).existsSync(), isTrue);
    expect(File(Assets.jsons.wastes).existsSync(), isTrue);
  });
}
