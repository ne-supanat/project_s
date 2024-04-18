import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../helpers/bg_audio_helper.dart';

class MainMenuState {
  final bool started;

  MainMenuState({required this.started});

  factory MainMenuState.i() {
    return MainMenuState(
      started: !kIsWeb,
    );
  }

  copyWith({bool? started}) {
    return MainMenuState(
      started: started ?? this.started,
    );
  }
}

class MainMenuBloc extends Cubit<MainMenuState> {
  MainMenuBloc() : super(MainMenuState.i());

  final bgAudioHelper = GetIt.I.get<BgAudioHelper>();
  final FocusNode focusNode = FocusNode();

  bool get _started => state.started;

  onReady(context) {
    setupBgMusic();
    FocusScope.of(context).requestFocus(focusNode);
  }

  setupBgMusic() async {
    await bgAudioHelper.setup();

    if (_started) {
      bgAudioHelper.play();
    }
  }

  dispose() {
    focusNode.dispose();
    bgAudioHelper.dispose();
  }

  KeyEventResult handleKeyEvent(FocusNode node, KeyEvent event) {
    start();
    return KeyEventResult.ignored;
  }

  start() {
    emit(state.copyWith(started: true));
    if (!bgAudioHelper.playing) {
      bgAudioHelper.play();
    }
  }
}
