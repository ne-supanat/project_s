import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:project_s/gen/assets.gen.dart';

void main() {
  test('audios assets test', () {
    expect(File(Assets.audios.musicHothamMorningBliss).existsSync(), isTrue);
    expect(File(Assets.audios.musicTakeYourTimeDanLebowitz).existsSync(), isTrue);
    expect(File(Assets.audios.sfxBoing).existsSync(), isTrue);
    expect(File(Assets.audios.sfxCongratulations).existsSync(), isTrue);
    expect(File(Assets.audios.sfxTwinkle).existsSync(), isTrue);
  });
}
