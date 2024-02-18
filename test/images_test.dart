import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:project_s/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.bg).existsSync(), isTrue);
    expect(File(Images.bgGif).existsSync(), isTrue);
  });
}
