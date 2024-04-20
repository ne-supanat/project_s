import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import '../../constants/chalenge_level.dart';
import '../../constants/level_resource.dart';
import '../../generated/assets.gen.dart';
import '../../helpers/waste_helper.dart';

import '../../helpers/sharedpref.dart';
import '../../models/level_model.dart';
import '../../widgets/chalenge_end_dialog.dart';

import '../../../../../models/waste_model.dart';
import '../../generated/l10n.dart';
import '../../widgets/learning_end_dialog.dart';
import 'gameplay_view.dart';

class GameplayState {
  final Queue<WasteModel> queue;
  final Offset shakeOffset;
  final bool showHint;
  final num score;
  final num timeRemainPercentage;
  final double cardScale;
  final Offset cardSlide;

  GameplayState({
    required this.queue,
    required this.shakeOffset,
    required this.showHint,
    required this.score,
    required this.timeRemainPercentage,
    required this.cardScale,
    required this.cardSlide,
  });

  factory GameplayState.i() {
    return GameplayState(
      queue: Queue(),
      shakeOffset: Offset.zero,
      showHint: false,
      score: 0,
      timeRemainPercentage: 1,
      cardScale: 1,
      cardSlide: Offset.zero,
    );
  }

  copyWith({
    Queue<WasteModel>? queue,
    Offset? shakeOffset,
    bool? showHint,
    num? score,
    num? timeRemainPercentage,
    double? cardScale,
    Offset? cardSlide,
  }) {
    return GameplayState(
      queue: queue ?? this.queue,
      shakeOffset: shakeOffset ?? this.shakeOffset,
      showHint: showHint ?? this.showHint,
      score: score ?? this.score,
      timeRemainPercentage: timeRemainPercentage ?? this.timeRemainPercentage,
      cardScale: cardScale ?? this.cardScale,
      cardSlide: cardSlide ?? this.cardSlide,
    );
  }

  cardChanged(GameplayState otherState) {
    return cardScale != otherState.cardScale ||
        cardSlide != otherState.cardSlide ||
        shakeOffset != otherState.shakeOffset ||
        queue != otherState.queue;
  }
}

class GameplayBloc extends Cubit<GameplayState> {
  GameplayBloc() : super(GameplayState.i());

  final SharedPref _sharedPref = GetIt.I.get<SharedPref>();

  late GameplayViewArguments arguments;
  late int? level;
  late ChalengeLevel? chalengeLevel;

  final AudioPlayer _audioPlayer = AudioPlayer();

  Queue<WasteModel> get _queue => state.queue;
  List<WasteModel> wastes = WasteHelper().all;

  final shakeOffsets = const [
    Offset(0.05, 0.0),
    Offset(-0.05, 0.0),
    Offset(0.05, 0.0),
    Offset(-0.05, 0.0)
  ];

  bool showKnowledge = false;

  //LEARNING
  LevelModel? levelModel;
  num mistake = 0;

  //CHALENGE
  num get _score => state.score;
  num oldHighScore = 0;

  late Animation<num> timeRemainPercentageAnimation;
  late AnimationController animationController;

  Timer? timer;

  int lastIndex = -1;

  init(context, GameplayViewArguments arguments, TickerProvider vsync) {
    level = arguments.level;
    chalengeLevel = arguments.chalengeLevel;

    _audioPlayer.setAsset(Assets.audios.sfxTwinkle);
    _audioPlayer.setVolume(0.75);

    if (level != null) {
      _startLearningMode(context);
    } else {
      _setupTimerUI(vsync);
      _startChalengeMode(context);
    }
  }

  dipose() {
    timer?.cancel();
    if (chalengeLevel != null) {
      animationController.dispose();
    }
  }

  _startLearningMode(context) {
    levelModel = LevelResource().levels[level];

    if (levelModel == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(S.of(context).game_page_level_not_found)));
      Navigator.pop(context);
    }

    mistake = 0;
    wastes = WasteHelper().getWasteFromNames(levelModel?.wasteNames ?? []);
    wastes.shuffle();
    addCardToQueue();
  }

  _onEndLearningMode(context) async {
    final num mistakeP = mistake / levelModel!.wasteNames.length;
    final num score = 1 - (mistakeP > 1 ? 1 : mistakeP);

    num starScore = 0;

    if (mistake == 0) {
      starScore = 3;
    } else if (score > 0.8) {
      starScore = 2;
    } else if (score > 0.5) {
      starScore = 1;
    } else {
      starScore = 0;
    }

    final oldScore = _sharedPref.getLearningLevelScore(level!);
    if (starScore > oldScore) {
      await _sharedPref.writeLearningLevelScore(level!, starScore.toInt());
    }

    _audioPlayer.play();

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => LearningEndDialog(
          score: starScore,
          onPlayAgain: () {
            Navigator.pop(c);
            _startLearningMode(context);
          },
          onBack: () {
            Navigator.pop(context);
            Navigator.pop(context);
          }),
    );
  }

  _setupTimerUI(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      duration: Duration(seconds: chalengeLevel!.time.toInt()),
    );
    timeRemainPercentageAnimation = Tween<double>(begin: 1, end: 0).animate(animationController);

    timeRemainPercentageAnimation.addListener(() {
      if (!isClosed) {
        emit(state.copyWith(timeRemainPercentage: timeRemainPercentageAnimation.value));
      }
    });

    animationController.forward();
  }

  _startChalengeMode(BuildContext context) {
    oldHighScore = _sharedPref.getChalengeHighScore(chalengeLevel!);

    wastes = WasteHelper().all;
    clearQueue();
    addCardToQueue();

    emit(state.copyWith(score: 0));

    renewTimer(context);
  }

  renewTimer(BuildContext context) {
    timer?.cancel();

    animationController
      ..reset()
      ..forward();

    timer = Timer(Duration(seconds: chalengeLevel!.time.toInt()), () async {
      await _onEndChalengeMode(context);
    });
  }

  _onEndChalengeMode(context) async {
    _audioPlayer.play();
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => ChalengeEndDialog(
          score: _score,
          highScore: oldHighScore,
          onPlayAgain: () {
            if (showKnowledge) {
              Navigator.pop(c);
            }
            Navigator.pop(c);
            _startChalengeMode(context);
          },
          onBack: () {
            if (showKnowledge) {
              Navigator.pop(c);
            }
            Navigator.pop(context);
            Navigator.pop(context);
          }),
    );
  }

  onCorrectPlace(context) async {
    emit(state.copyWith(score: _score + 1));

    emit(state.copyWith(queue: _queue..removeFirst()));

    if (wastes.isEmpty) {
      _onEndLearningMode(context);
    } else {
      addCardToQueue();
    }

    if (chalengeLevel != null) {
      renewTimer(context);
      if (_score > oldHighScore) {
        await _sharedPref.writeChalengeHighScore(chalengeLevel!, _score.toInt());
      }
    }
  }

  onWrongPlace() {
    mistake++;
    wrongEffect();
  }

  wrongEffect() async {
    for (final offset in shakeOffsets) {
      emit(state.copyWith(shakeOffset: offset));
      await Future.delayed(const Duration(milliseconds: 50));
    }

    emit(state.copyWith(shakeOffset: Offset.zero));
  }

  addCardToQueue() {
    if (level != null) {
      emit(state.copyWith(queue: _queue..add(wastes[0])));
      wastes.removeAt(0);
    } else {
      int newIndex = lastIndex;
      do {
        newIndex = Random().nextInt(wastes.length);
      } while (newIndex == lastIndex);
      lastIndex = newIndex;
      emit(state.copyWith(queue: _queue..add(wastes[newIndex])));
    }

    spawnCardEffect();
  }

  spawnCardEffect() async {
    emit(state.copyWith(cardScale: 1.01, cardSlide: const Offset(0.0, -0.02)));
    await Future.delayed(const Duration(milliseconds: 100));
    emit(state.copyWith(cardScale: 1, cardSlide: Offset.zero));
  }

  clearQueue() {
    emit(state.copyWith(queue: Queue()));
  }

  updateShowKnowledge(bool value) {
    showKnowledge = value;
  }

  updateShowHint(bool value) {
    emit(state.copyWith(showHint: value));
  }
}
