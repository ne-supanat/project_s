import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:project_s/resources/resources.dart';

void main() {
  test('audios assets test', () {
    expect(File(Audios.aNewLeafMaster).existsSync(), isTrue);
  });
}
