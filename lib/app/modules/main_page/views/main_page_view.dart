import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/chalenge_level.dart';
import '../../../../constants/waste_type.dart';
import '../../../../widgets/bin_placeholder.dart';
import '../../../../widgets/chalenge_dialog.dart';
import '../../../../widgets/knowledge_dialog.dart';
import '../../../../widgets/waste_card.dart';
import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        constraints: const BoxConstraints(
          maxHeight: 500,
          maxWidth: 500,
        ),
        child: layout(),
      ),
    ));
  }

  layout() {
    const padding = 16.0;
    return Obx(
      () => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(top: 0, child: _gui()),
          _cardHeap(),
          Positioned(
            left: padding,
            child: _danger(),
          ),
          Positioned(
            bottom: padding,
            child: _recycle(),
          ),
          Positioned(
            right: padding,
            child: _general(),
          ),
        ],
      ),
    );
  }

  _gui() {
    return Container(
      width: Get.width,
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilledButton(
                  onPressed: () {
                    if (controller.chalengeLevel.value == null) {
                      Get.dialog(
                        ChalengeDialog(
                          onSetupChalenge: (ChalengeLevel level) {
                            controller.updateChalengeLevel(level);
                          },
                        ),
                      );
                    } else {
                      controller.resetChalenge();
                    }
                  },
                  child: Text(
                      controller.chalengeLevel.value == null ? 'Start Chalenge' : 'End Chalenge'),
                ),
                FilledButton(
                  onPressed: () {
                    Get.dialog(const KnowledgeDialog());
                  },
                  child: const Text('Knowledge'),
                ),
                Row(
                  children: [
                    const Text('Hint'),
                    Switch(
                        value: controller.showHint.isTrue,
                        onChanged: (value) {
                          controller.updateShowHint(value);
                        })
                  ],
                ),
              ],
            ),
            const SizedBox(width: 16),
            if (controller.chalengeLevel.value != null)
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('score: ${controller.score}'),
                  LinearProgressIndicator(
                    value: controller.timeRemainPercentage.value.toDouble(),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red,
                  ),
                ],
              ))
          ],
        ),
      ),
    );
  }

  _cardHeap() {
    return IndexedStack(
      children: controller.queue.value
          .map((e) => AnimatedSlide(
                offset: controller.shakeOffset.value,
                duration: const Duration(milliseconds: 50),
                curve: Curves.ease,
                child: WasteCard(
                  value: e,
                  showHint: controller.showHint.isTrue,
                ),
              ))
          .toList(),
    );
  }

  _danger() {
    return Column(
      children: [
        _binPlaceHolder(WasteType.biohazard),
        _binPlaceHolder(WasteType.electronic),
      ],
    );
  }

  _recycle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _binPlaceHolder(WasteType.paper),
        _binPlaceHolder(WasteType.plastic),
        _binPlaceHolder(WasteType.aluminium),
      ],
    );
  }

  _general() {
    return Column(
      children: [
        _binPlaceHolder(WasteType.food),
        _binPlaceHolder(WasteType.general),
      ],
    );
  }

  _binPlaceHolder(WasteType type) {
    return BinPlaceHolder(
      targetValue: type,
      onCorrectPlace: (value) {
        controller.onCorrectPlace();
      },
      onWrongPlace: (value) {
        controller.wrongEffect();
      },
      showHint: controller.showHint.isTrue,
    );
  }
}
