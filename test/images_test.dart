import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:project_s/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.bg).existsSync(), isTrue);
    expect(File(Images.bgAnimation).existsSync(), isTrue);
    expect(File(Images.bgGif).existsSync(), isTrue);
    expect(File(Images.icAluminum).existsSync(), isTrue);
    expect(File(Images.icElectronic).existsSync(), isTrue);
    expect(File(Images.icGeneral).existsSync(), isTrue);
    expect(File(Images.icGlass).existsSync(), isTrue);
    expect(File(Images.icHazardous).existsSync(), isTrue);
    expect(File(Images.icOrganic).existsSync(), isTrue);
    expect(File(Images.icPaper).existsSync(), isTrue);
    expect(File(Images.icPlastic).existsSync(), isTrue);
  });
}
