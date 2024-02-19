import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project_s/constants/chalenge_level.dart';
import 'package:project_s/constants/level_resource.dart';
import 'package:project_s/constants/waste_resource.dart';
import 'package:project_s/helpers/sharedpref.dart';
import 'package:project_s/helpers/translations.dart';
import 'package:project_s/models/level_model.dart';
import 'package:project_s/widgets/chalenge_end_dialog.dart';

import '../../../../models/waste_model.dart';
import '../widgets/learning_end_dialog.dart';
import 'game_page_view.dart';

class GamePageState {
  final Queue<WasteModel> queue;
  final Offset shakeOffset;
  final bool showHint;
  final num score;
  final num timeRemainPercentage;
  final double cardScale;
  final Offset cardSlide;

  GamePageState({
    required this.queue,
    required this.shakeOffset,
    required this.showHint,
    required this.score,
    required this.timeRemainPercentage,
    required this.cardScale,
    required this.cardSlide,
  });

  factory GamePageState.i() {
    return GamePageState(
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
    return GamePageState(
      queue: queue ?? this.queue,
      shakeOffset: shakeOffset ?? this.shakeOffset,
      showHint: showHint ?? this.showHint,
      score: score ?? this.score,
      timeRemainPercentage: timeRemainPercentage ?? this.timeRemainPercentage,
      cardScale: cardScale ?? this.cardScale,
      cardSlide: cardSlide ?? this.cardSlide,
    );
  }
}

class GamePageController extends Cubit<GamePageState> {
  GamePageController() : super(GamePageState.i());

  final SharedPref _sharedPref = GetIt.I.get<SharedPref>();

  late GamePageViewArguments arguments;
  late int? level;
  late ChalengeLevel? chalengeLevel;

  Queue<WasteModel> get queue => state.queue;
  List<WasteModel> wastes = WasteResource().all;

  final shakeOffsets = const [
    Offset(0.05, 0.0),
    Offset(-0.05, 0.0),
    Offset(0.05, 0.0),
    Offset(-0.05, 0.0)
  ];

  Offset get shakeOffset => state.shakeOffset;
  double get cardScale => state.cardScale;
  Offset get cardSlide => state.cardSlide;

  bool get showHint => state.showHint;

  //LEARNING
  LevelModel? levelModel;
  num mistake = 0;

  //CHALENGE
  num get score => state.score;
  num oldHighScore = 0;

  num timeMax = double.infinity;
  num timeRemain = double.infinity;

  num get timeRemainPercentage => state.timeRemainPercentage;

  Timer? timer;

  int lastIndex = -1;

  init(context, GamePageViewArguments arguments) {
    level = arguments.level;
    chalengeLevel = arguments.chalengeLevel;

    if (level != null) {
      _startLearningMode(context);
    } else {
      _startChalengeMode(context);
    }
  }

  dipose() {
    timer?.cancel();
  }

  _startLearningMode(context) {
    levelModel = LevelResource().levels[level];

    if (levelModel == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Fail to load data')));
      Navigator.pop(context);
    }

    mistake = 0;
    wastes = WasteResource().getWasteFromNames(levelModel?.wasteNames ?? []);
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

  _startChalengeMode(BuildContext context) {
    oldHighScore = _sharedPref.getChalengeHighScore(chalengeLevel!);

    wastes = WasteResource().all;
    clearQueue();
    addCardToQueue();

    timeMax = chalengeLevel?.time ?? double.infinity;
    timeRemain = timeMax;
    emit(state.copyWith(timeRemainPercentage: 1));
    emit(state.copyWith(score: 0));

    runTimer(context);
  }

  runTimer(BuildContext context) {
    timer?.cancel();

    timer = Timer(const Duration(milliseconds: 10), () async {
      timeRemain -= 0.01;

      emit(state.copyWith(timeRemainPercentage: timeRemain / timeMax));

      if (timeRemain > 0) {
        runTimer(context);
      } else {
        await _onEndChalengeMode(context);
      }
    });
  }

  _onEndChalengeMode(context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => ChalengeEndDialog(
          score: score,
          highScore: oldHighScore,
          onPlayAgain: () {
            Navigator.pop(c);
            _startChalengeMode(context);
          },
          onBack: () {
            Navigator.pop(context);
            Navigator.pop(context);
          }),
    );
  }

  onCorrectPlace(context) async {
    emit(state.copyWith(score: score + 1));
    timeRemain = timeMax;

    emit(state.copyWith(timeRemainPercentage: timeRemain / timeMax));
    emit(state.copyWith(queue: queue..removeFirst()));

    if (wastes.isEmpty) {
      _onEndLearningMode(context);
    } else {
      addCardToQueue();
    }

    if (chalengeLevel != null) {
      if (score > oldHighScore) {
        await _sharedPref.writeChalengeHighScore(chalengeLevel!, score.toInt());
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
      emit(state.copyWith(queue: queue..add(wastes[0])));
      wastes.removeAt(0);
    } else {
      int newIndex = lastIndex;
      do {
        newIndex = Random().nextInt(wastes.length);
      } while (newIndex == lastIndex);
      lastIndex = newIndex;
      emit(state.copyWith(queue: queue..add(wastes[newIndex])));
    }

    spawnCardEffect();
  }

  spawnCardEffect() async {
    emit(state.copyWith(cardScale: 1.01));
    emit(state.copyWith(cardSlide: const Offset(0.0, -0.02)));
    await Future.delayed(const Duration(milliseconds: 100));
    emit(state.copyWith(cardScale: 1));
    emit(state.copyWith(cardSlide: Offset.zero));
  }

  clearQueue() {
    emit(state.copyWith(queue: Queue()));
  }

  updateShowHint(bool value) {
    emit(state.copyWith(showHint: value));
  }
}
