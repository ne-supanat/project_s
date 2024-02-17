import 'package:flutter/material.dart';
import 'package:project_s/widgets/app_scaffold.dart';

import '../constants/chalenge_level.dart';
import '../constants/waste_type.dart';
import '../widgets/bin_placeholder.dart';
import '../widgets/knowledge_dialog.dart';
import '../widgets/waste_card.dart';
import 'game_page_controller.dart';

class GamePageViewArguments {
  final int? level;
  final ChalengeLevel? chalengeLevel;

  GamePageViewArguments({this.level, this.chalengeLevel});
}

class GamePageView extends StatefulWidget {
  const GamePageView({super.key, required this.arguments});

  final GamePageViewArguments arguments;

  @override
  State<GamePageView> createState() => _GamePageViewState();
}

class _GamePageViewState extends State<GamePageView> {
  final GamePageController controller = GamePageController();

  @override
  void initState() {
    super.initState();
    controller.init(context, widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold<GamePageState>(
      controller: controller,
      body: layout,
    );
  }

  Widget layout(BuildContext context) {
    const padding = 16.0;
    return Stack(
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
    );
  }

  _gui() {
    return Container(
      width: MediaQuery.of(context).size.width,
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilledButton(
                  onPressed: () {
                    showDialog(context: context, builder: (c) => const KnowledgeDialog());
                  },
                  child: const Text('Knowledge'),
                ),
                Row(
                  children: [
                    const Text('Hint'),
                    Switch(
                        value: controller.showHint,
                        onChanged: (value) {
                          controller.updateShowHint(value);
                        })
                  ],
                ),
              ],
            ),
            const SizedBox(width: 16),
            if (controller.chalengeLevel != null)
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('score: ${controller.score}'),
                  LinearProgressIndicator(
                    value: controller.timeRemainPercentage.toDouble(),
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
      children: controller.queue
          .map((e) => AnimatedSlide(
                offset: controller.shakeOffset,
                duration: const Duration(milliseconds: 50),
                curve: Curves.ease,
                child: WasteCard(
                  value: e,
                  showHint: controller.showHint,
                ),
              ))
          .toList(),
    );
  }

  _danger() {
    return _categoryZone(
      category: WasteCategory.danger,
      child: Column(
        children: [
          _binPlaceHolder(WasteType.biohazard),
          _binPlaceHolder(WasteType.electronic),
        ],
      ),
    );
  }

  _recycle() {
    return _categoryZone(
      category: WasteCategory.recycle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _binPlaceHolder(WasteType.paper),
          _binPlaceHolder(WasteType.plastic),
          _binPlaceHolder(WasteType.aluminium),
        ],
      ),
    );
  }

  _general() {
    return _categoryZone(
      category: WasteCategory.common,
      child: Column(
        children: [
          _binPlaceHolder(WasteType.food),
          _binPlaceHolder(WasteType.general),
        ],
      ),
    );
  }

  _categoryZone({required WasteCategory category, required Widget child}) {
    final enable = controller.levelModel?.availableCategories.contains(category) ?? true;
    return AbsorbPointer(
      absorbing: !enable,
      child: Opacity(
        opacity: enable ? 1 : 0.1,
        child: child,
      ),
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
      onMoveIn: () {
        controller.onMoveIn(type);
      },
      onMoveOut: () {
        controller.onMoveOut(type);
      },
      showHint: controller.showHint,
    );
  }
}
