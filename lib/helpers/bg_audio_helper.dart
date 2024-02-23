import 'package:just_audio/just_audio.dart';

import '../resources/resources.dart';
import 'asset_path_helper.dart';

class BgAudioHelper {
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool get playing => _audioPlayer.playing;

  Future setup() async {
    await _audioPlayer.setAsset(Audios.aNewLeafMaster.platformAsset);
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setVolume(0.2);
  }

  play() {
    _audioPlayer.play();
  }
}
