import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../helpers/bg_audio_helper.dart';

class MainPageState {
  final bool started;

  MainPageState({required this.started});

  factory MainPageState.i() {
    return MainPageState(
      started: !kIsWeb,
    );
  }

  copyWith({bool? started}) {
    return MainPageState(
      started: started ?? this.started,
    );
  }
}

class MainPageController extends Cubit<MainPageState> {
  MainPageController() : super(MainPageState.i());

  final bgAudioHelper = GetIt.I.get<BgAudioHelper>();
  final FocusNode focusNode = FocusNode();

  bool get started => state.started;

  onReady(context) {
    setupBgMusic();
    FocusScope.of(context).requestFocus(focusNode);
  }

  setupBgMusic() async {
    await bgAudioHelper.setup();

    if (started) {
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
