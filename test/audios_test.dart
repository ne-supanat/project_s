import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:project_s/resources/resources.dart';

void main() {
  test('audios assets test', () {
    expect(File(Audios.musicANewLeafMaster).existsSync(), isTrue);
    expect(File(Audios.musicHothamMorningBliss).existsSync(), isTrue);
    expect(File(Audios.musicHothamTranquilTimes).existsSync(), isTrue);
    expect(File(Audios.musicLakes).existsSync(), isTrue);
    expect(File(Audios.sfxBoing).existsSync(), isTrue);
    expect(File(Audios.sfxCongratulations).existsSync(), isTrue);
    expect(File(Audios.sfxCorrect).existsSync(), isTrue);
    expect(File(Audios.sfxError).existsSync(), isTrue);
    expect(File(Audios.sfxPing).existsSync(), isTrue);
    expect(File(Audios.sfxTwinkle).existsSync(), isTrue);
  });
}
