import 'package:get/get.dart';

import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:project_s/constants/chalenge_level.dart';
import 'package:project_s/constants/waste_list.dart';

import '../../../../models/waste_model.dart';
import '../../../../widgets/chalenge_end_dialog.dart';

class MainPageController extends GetxController {
  final Rx<Queue<WasteModel>> queue = Rx<Queue<WasteModel>>(Queue());
  RxList a = RxList();
  final List<WasteModel> wastes = WasteResource().all;

  final shakeOffsets = const [
    Offset(0.05, 0.0),
    Offset(-0.05, 0.0),
    Offset(0.05, 0.0),
    Offset(-0.05, 0.0)
  ];

  Rx<Offset> shakeOffset = Rx(Offset.zero);

  RxBool showHint = RxBool(false);
  Rxn<ChalengeLevel> chalengeLevel = Rxn();

  RxNum score = RxNum(0);
  num timeMax = double.infinity;
  num timeRemain = double.infinity;

  RxNum timeRemainPercentage = RxNum(1);

  Timer? timer;

  int lastIndex = -1;

  final StreamController<num> _timeRemainController = StreamController<num>();
  Stream<num> get timeRemainStream => _timeRemainController.stream;

  @override
  void onInit() {
    super.onInit();
    addCardToQueue();
  }

  onCorrectPlace() {
    score(score.value + 1);
    timeRemain = timeMax;
    timeRemainPercentage(timeRemain / timeMax);

    queue.value.removeFirst();
    addCardToQueue();
  }

  wrongEffect() async {
    for (final offset in shakeOffsets) {
      shakeOffset(offset);
      await Future.delayed(const Duration(milliseconds: 50));
    }

    shakeOffset(Offset.zero);
  }

  addCardToQueue() {
    int newIndex = lastIndex;
    do {
      newIndex = Random().nextInt(wastes.length);
    } while (newIndex == lastIndex);
    lastIndex = newIndex;
    queue.value.add(wastes[lastIndex]);
  }

  updateShowHint(bool value) {
    showHint(value);
  }

  updateChalengeLevel(ChalengeLevel? level) {
    chalengeLevel(level);
    timeMax = level?.time ?? double.infinity;
    timeRemain = timeMax;
    timeRemainPercentage(1);

    runTimer();
  }

  resetChalenge() {
    chalengeLevel.value = null;
    timeMax = double.infinity;
    timeRemain = double.infinity;
    timeRemainPercentage(1);
    score(0);
  }

  runTimer() {
    timer?.cancel();

    timer = Timer(const Duration(seconds: 1), () {
      timeRemain--;

      timeRemainPercentage(timeRemain / timeMax);

      if (timeRemain > 0) {
        runTimer();
      } else {
        Get.dialog(ChalengeEndDialog(score: score.value));
        resetChalenge();
      }
    });
  }
}
