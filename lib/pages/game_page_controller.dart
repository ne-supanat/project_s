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
import 'package:project_s/models/level_model.dart';
import 'package:project_s/widgets/chalenge_end_dialog.dart';

import '../../../../models/waste_model.dart';
import 'game_page_view.dart';

class GamePageState {
  final Queue<WasteModel> queue;
  final Offset shakeOffset;
  final bool showHint;
  final num score;
  final num timeRemainPercentage;
  final Map<String, int> binIndexes;
  final double cardScale;
  final Offset cardSlide;

  GamePageState({
    required this.queue,
    required this.shakeOffset,
    required this.showHint,
    required this.score,
    required this.timeRemainPercentage,
    required this.binIndexes,
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
      binIndexes: {},
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
    Map<String, int>? binIndexes,
    double? cardScale,
    Offset? cardSlide,
  }) {
    return GamePageState(
      queue: queue ?? this.queue,
      shakeOffset: shakeOffset ?? this.shakeOffset,
      showHint: showHint ?? this.showHint,
      score: score ?? this.score,
      timeRemainPercentage: timeRemainPercentage ?? this.timeRemainPercentage,
      binIndexes: binIndexes ?? this.binIndexes,
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

  LevelModel? levelModel;

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

  num get score => state.score;
  num timeMax = double.infinity;
  num timeRemain = double.infinity;

  num get timeRemainPercentage => state.timeRemainPercentage;

  Timer? timer;

  int lastIndex = -1;

  Map<String, int> get binIndexes => state.binIndexes;

  init(context, GamePageViewArguments arguments) {
    level = arguments.level;
    chalengeLevel = arguments.chalengeLevel;

    if (level != null) {
      _loadLevel(context);
    }

    if (chalengeLevel != null) {
      _startChalenge(context);
    }
  }

  _loadLevel(context) {
    levelModel = LevelResource().levels[level];

    if (levelModel == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Fail to load data')));
      Navigator.pop(context);
    }

    wastes = WasteResource().getWasteFromNames(levelModel?.wasteNames ?? []);
    addCardToQueue();
  }

  _startChalenge(BuildContext context) {
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
        await _onEndChalenge(context);
      }
    });
  }

  _onEndChalenge(context) async {
    final oldHighScore = _sharedPref.getHighScore();

    if (score > oldHighScore) {
      await _sharedPref.writeHighScore(score.toInt());
    }

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => ChalengeEndDialog(
          score: score,
          highScore: oldHighScore,
          onPlayAgain: () {
            Navigator.pop(c);
            _startChalenge(context);
          },
          onBack: () {
            Navigator.pop(context);
            Navigator.pop(context);
          }),
    );
  }

  onCorrectPlace() {
    emit(state.copyWith(score: score + 1));
    timeRemain = timeMax;

    emit(state.copyWith(timeRemainPercentage: timeRemain / timeMax));
    emit(state.copyWith(queue: queue..removeFirst()));

    addCardToQueue();
  }

  wrongEffect() async {
    for (final offset in shakeOffsets) {
      emit(state.copyWith(shakeOffset: offset));
      await Future.delayed(const Duration(milliseconds: 50));
    }

    emit(state.copyWith(shakeOffset: Offset.zero));
  }

  addCardToQueue() {
    int newIndex = lastIndex;
    do {
      newIndex = Random().nextInt(wastes.length);
    } while (newIndex == lastIndex);
    lastIndex = newIndex;
    emit(state.copyWith(queue: queue..add(wastes[lastIndex])));
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
