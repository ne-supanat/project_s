import 'package:just_audio/just_audio.dart';

import '../generated/assets.gen.dart';

class BgAudioHelper {
  final AudioPlayer _audioPlayer;

  BgAudioHelper(this._audioPlayer);

  bool get playing => _audioPlayer.playing;

  Future setup() async {
    _audioPlayer.setAsset(Assets.audios.musicTakeYourTimeDanLebowitz);
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
