import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_s/constants/chalenge_level.dart';
import 'package:project_s/constants/level_resource.dart';
import 'package:project_s/constants/waste_resource.dart';
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

  GamePageState({
    required this.queue,
    required this.shakeOffset,
    required this.showHint,
    required this.score,
    required this.timeRemainPercentage,
  });

  factory GamePageState.i() {
    return GamePageState(
      queue: Queue(),
      shakeOffset: Offset.zero,
      showHint: false,
      score: 0,
      timeRemainPercentage: 1,
    );
  }

  copyWith({
    Queue<WasteModel>? queue,
    Offset? shakeOffset,
    bool? showHint,
    num? score,
    num? timeRemainPercentage,
  }) {
    return GamePageState(
      queue: queue ?? this.queue,
      shakeOffset: shakeOffset ?? this.shakeOffset,
      showHint: showHint ?? this.showHint,
      score: score ?? this.score,
      timeRemainPercentage: timeRemainPercentage ?? this.timeRemainPercentage,
    );
  }
}

class GamePageController extends Cubit<GamePageState> {
  GamePageController() : super(GamePageState.i());

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

  bool get showHint => state.showHint;

  num get score => state.score;
  num timeMax = double.infinity;
  num timeRemain = double.infinity;

  num get timeRemainPercentage => state.timeRemainPercentage;

  Timer? timer;

  int lastIndex = -1;

  init(context, GamePageViewArguments arguments) {
    level = arguments.level;
    chalengeLevel = arguments.chalengeLevel;

    if (level != null) {
      _loadLevel(context);
    }

    if (chalengeLevel != null) {
      // _startChalenge();
    }
  }

  updateScore() {
    emit(state.copyWith(score: score + 1));
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
  }

  updateShowHint(bool value) {
    emit(state.copyWith(showHint: value));
  }

  _startChalenge(BuildContext context) {
    timeMax = chalengeLevel?.time ?? double.infinity;
    timeRemain = timeMax;
    emit(state.copyWith(timeRemainPercentage: 1));

    runTimer(context);
  }

  resetChalenge() {
    timeMax = double.infinity;
    timeRemain = double.infinity;
    emit(state.copyWith(timeRemainPercentage: 1));
    emit(state.copyWith(score: 0));
  }

  runTimer(BuildContext context) {
    timer?.cancel();

    timer = Timer(const Duration(seconds: 1), () {
      timeRemain--;

      emit(state.copyWith(timeRemainPercentage: timeRemain / timeMax));

      if (timeRemain > 0) {
        runTimer(context);
      } else {
        showDialog(
          context: context,
          builder: (context) => ChalengeEndDialog(score: score),
        );

        resetChalenge();
      }
    });
  }
}

// class GamePageControllerBloc extends Cubit<GamePageController> {
//   GamePageControllerBloc() : super(GamePageController());

//   late GamePageViewArguments arguments;
//   late int? level;
//   late ChalengeLevel? chalengeLevel;

//   LevelModel? levelModel;

//   final Queue<WasteModel> queue = Queue();
//   List<WasteModel> wastes = WasteResource().all;

//   final shakeOffsets = const [
//     Offset(0.05, 0.0),
//     Offset(-0.05, 0.0),
//     Offset(0.05, 0.0),
//     Offset(-0.05, 0.0)
//   ];

//   // Rx<Offset> shakeOffset = Rx(Offset.zero);
//   Offset shakeOffset = Offset.zero;

//   // RxBool showHint = RxBool(false);
//   bool showHint = false;

//   num score = 0;
//   num timeMax = double.infinity;
//   num timeRemain = double.infinity;

//   // RxNum timeRemainPercentage = RxNum(1);
//   num timeRemainPercentage = 1;

//   Timer? timer;

//   int lastIndex = -1;

//   init(context, GamePageViewArguments arguments) {
//     level = arguments.level;
//     chalengeLevel = arguments.chalengeLevel;

//     if (level != null) {
//       _loadLevel(context);
//     }

//     if (chalengeLevel != null) {
//       // _startChalenge();
//     }
//   }

//   updateScore() {
//     score++;
//     setScore(score);
//   }

//   _loadLevel(context) {
//     levelModel = LevelResource().levels[level];

//     if (levelModel == null) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Fail to load data')));
//       Navigator.pop(context);
//     }

//     wastes = WasteResource().getWasteFromNames(levelModel?.wasteNames ?? []);
//     addCardToQueue();
//   }

//   onCorrectPlace() {
//     scoreBloc.set(scoreBloc.state + 1);
//     timeRemain = timeMax;
//     timeRemainPercentage(timeRemain / timeMax);

//     queueBloc.remove();
//     addCardToQueue();
//   }

//   wrongEffect() async {
//     for (final offset in shakeOffsets) {
//       shakeOffset(offset);
//       await Future.delayed(const Duration(milliseconds: 50));
//     }

//     shakeOffset(Offset.zero);
//   }

//   addCardToQueue() {
//     int newIndex = lastIndex;
//     do {
//       newIndex = Random().nextInt(wastes.length);
//     } while (newIndex == lastIndex);
//     lastIndex = newIndex;
//     queueBloc.add(wastes[lastIndex]);
//   }

//   // updateShowHint(bool value) {
//   //   showHint(value);
//   // }

//   // _startChalenge() {
//   //   timeMax = chalengeLevel?.time ?? double.infinity;
//   //   timeRemain = timeMax;
//   //   timeRemainPercentage(1);

//   //   runTimer();
//   // }

//   // resetChalenge() {
//   //   timeMax = double.infinity;
//   //   timeRemain = double.infinity;
//   //   timeRemainPercentage(1);
//   //   score(0);
//   // }

//   // runTimer() {
//   //   timer?.cancel();

//   //   timer = Timer(const Duration(seconds: 1), () {
//   //     timeRemain--;

//   //     timeRemainPercentage(timeRemain / timeMax);

//   //     if (timeRemain > 0) {
//   //       runTimer();
//   //     } else {
//   //       Get.dialog(ChalengeEndDialog(score: score.value));
//   //       resetChalenge();
//   //     }
//   //   });
//   // }
// }

// // class GamePageScoreBloc extends Cubit<num> {
// //   GamePageScoreBloc() : super(0);

// //   void set(value) => emit(value);
// // }

// // class GamePageQueueBloc extends Cubit<Queue<WasteModel>> {
// //   GamePageQueueBloc() : super(Queue());

// //   void set(value) => emit(value);
// //   void add(WasteModel value) => emit(state..add(value));
// //   void remove() => emit(state..removeFirst());
// // }

// // class GamePageShakeOffsetBloc extends Cubit<Offset> {
// //   GamePageShakeOffsetBloc() : super(Offset.zero);

// //   void set(value) => emit(value);
// // }

// // class GamePageTimeRemainPercentageBloc extends Cubit<num> {
// //   GamePageQueueBloc() : super(Queue());

// //   void set(value) => emit(value);
// // }

// class GamePageController {
//   final scoreBloc = GetIt.I.get<GamePageScoreBloc>();
//   final queueBloc = GetIt.I.get<GamePageQueueBloc>();

//   late GamePageViewArguments arguments;
//   late int? level;
//   late ChalengeLevel? chalengeLevel;

//   LevelModel? levelModel;

//   final Queue<WasteModel> queue = Queue();
//   List<WasteModel> wastes = WasteResource().all;

//   final shakeOffsets = const [
//     Offset(0.05, 0.0),
//     Offset(-0.05, 0.0),
//     Offset(0.05, 0.0),
//     Offset(-0.05, 0.0)
//   ];

//   // Rx<Offset> shakeOffset = Rx(Offset.zero);
//   Offset shakeOffset = Offset.zero;

//   // RxBool showHint = RxBool(false);
//   bool showHint = false;

//   num score = 0;
//   num timeMax = double.infinity;
//   num timeRemain = double.infinity;

//   // RxNum timeRemainPercentage = RxNum(1);
//   num timeRemainPercentage = 1;

//   Timer? timer;

//   int lastIndex = -1;

//   init(context, GamePageViewArguments arguments) {
//     level = arguments.level;
//     chalengeLevel = arguments.chalengeLevel;

//     if (level != null) {
//       _loadLevel(context);
//     }

//     if (chalengeLevel != null) {
//       // _startChalenge();
//     }
//   }

//   updateScore() {
//     score++;
//     scoreBloc.set(score);
//   }

//   _loadLevel(context) {
//     levelModel = LevelResource().levels[level];

//     if (levelModel == null) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Fail to load data')));
//       Navigator.pop(context);
//     }

//     wastes = WasteResource().getWasteFromNames(levelModel?.wasteNames ?? []);
//     addCardToQueue();
//   }

//   onCorrectPlace() {
//     scoreBloc.set(scoreBloc.state + 1);
//     timeRemain = timeMax;
//     timeRemainPercentage(timeRemain / timeMax);

//     queueBloc.remove();
//     addCardToQueue();
//   }

//   wrongEffect() async {
//     for (final offset in shakeOffsets) {
//       shakeOffset(offset);
//       await Future.delayed(const Duration(milliseconds: 50));
//     }

//     shakeOffset(Offset.zero);
//   }

//   addCardToQueue() {
//     int newIndex = lastIndex;
//     do {
//       newIndex = Random().nextInt(wastes.length);
//     } while (newIndex == lastIndex);
//     lastIndex = newIndex;
//     queueBloc.add(wastes[lastIndex]);
//   }

//   // updateShowHint(bool value) {
//   //   showHint(value);
//   // }

//   // _startChalenge() {
//   //   timeMax = chalengeLevel?.time ?? double.infinity;
//   //   timeRemain = timeMax;
//   //   timeRemainPercentage(1);

//   //   runTimer();
//   // }

//   // resetChalenge() {
//   //   timeMax = double.infinity;
//   //   timeRemain = double.infinity;
//   //   timeRemainPercentage(1);
//   //   score(0);
//   // }

//   // runTimer() {
//   //   timer?.cancel();

//   //   timer = Timer(const Duration(seconds: 1), () {
//   //     timeRemain--;

//   //     timeRemainPercentage(timeRemain / timeMax);

//   //     if (timeRemain > 0) {
//   //       runTimer();
//   //     } else {
//   //       Get.dialog(ChalengeEndDialog(score: score.value));
//   //       resetChalenge();
//   //     }
//   //   });
//   // }
// }
