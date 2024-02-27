import 'package:just_audio/just_audio.dart';

import '../resources/resources.dart';

class BgAudioHelper {
  final AudioPlayer _audioPlayer = AudioPlayer();

  bool get playing => _audioPlayer.playing;

  Future setup() async {
    _audioPlayer.setAsset(Audios.musicTakeYourTimeDanLebowitz);
  }

  play() {
    _audioPlayer.play();
    _audioPlayer.setLoopMode(LoopMode.one);
    _audioPlayer.setVolume(0.7);
  }

  pause() {
    _audioPlayer.pause();
  }

  resume() {
    _audioPlayer.play();
  }

  dispose() {
    _audioPlayer.dispose();
  }
}
