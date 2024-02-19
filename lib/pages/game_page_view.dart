import 'package:flutter/material.dart';
import 'package:project_s/constants/app_text_style.dart';
import 'package:project_s/widgets/app_scaffold.dart';

import '../constants/chalenge_level.dart';
import '../constants/color_name.dart';
import '../constants/waste_type.dart';
import '../widgets/app_back_icon_button.dart';
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
  void dispose() {
    controller.dipose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold<GamePageState>(
      controller: controller,
      body: layout2,
    );
  }

  Widget layout(BuildContext context) {
    const padding = 16.0;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Positioned(
          top: 0,
          child: _gui(),
        ),
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

  Widget layout2(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _gui(),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              border: Border.all(
                width: 4,
                color: ColorNames.black.withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.chalengeLevel != null)
                  LinearProgressIndicator(
                    value: controller.timeRemainPercentage.toDouble(),
                    minHeight: 12,
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red.shade400,
                  ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _danger(),
                    _cardHeap(),
                    _general(),
                  ],
                ),
                const SizedBox(height: 24),
                _recycle(),
              ],
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }

  _gui() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          constraints: const BoxConstraints(
            maxWidth: 500,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _helper(),
                const Spacer(),
                if (controller.chalengeLevel != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ColorNames.cream,
                        ),
                        child: Text(
                          'Score: ${controller.score}',
                          style: AppTextStyle.base.semibold,
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _helper() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const AppBackIconButton(),
        const SizedBox(width: 8),
        _knowledge(),
        const SizedBox(width: 8),
        _hint(),
      ],
    );
  }

  _knowledge() {
    return _helperButton(
      onPressed: () {
        showDialog(context: context, builder: (c) => const KnowledgeDialog());
      },
      icon: Icons.menu_book_rounded,
    );
  }

  _hint() {
    return _helperButton(
      onPressed: () {
        controller.updateShowHint(!controller.showHint);
      },
      icon: controller.showHint ? Icons.visibility_outlined : Icons.visibility_off_outlined,
    );
  }

  _helperButton({required Function() onPressed, required IconData icon}) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorNames.cream,
      ),
      child: IconButton(
        onPressed: onPressed,
        color: ColorNames.black333335,
        icon: Icon(icon),
      ),
    );
  }

  _cardHeap() {
    return AnimatedScale(
      scale: controller.cardScale,
      duration: const Duration(milliseconds: 100),
      curve: Curves.ease,
      child: AnimatedSlide(
        offset: controller.cardSlide,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
        child: AnimatedSlide(
          offset: controller.shakeOffset,
          duration: const Duration(milliseconds: 50),
          curve: Curves.ease,
          child: controller.queue.isNotEmpty
              ? WasteCard(
                  value: controller.queue.first,
                  showHint: controller.showHint,
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  _danger() {
    return _categoryZone(
      category: WasteCategory.danger,
      child: Column(
        children: [
          _binPlaceHolder(WasteType.biohazard),
          const SizedBox(height: 16),
          _binPlaceHolder(WasteType.electronic),
        ],
      ),
    );
  }

  _recycle() {
    return _categoryZone(
      category: WasteCategory.recycle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _binPlaceHolder(WasteType.paper),
          const SizedBox(width: 16),
          _binPlaceHolder(WasteType.plastic),
          const SizedBox(width: 16),
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
          const SizedBox(height: 16),
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
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: category.color.withOpacity(0.6),
          ),
          child: child,
        ),
      ),
    );
  }

  _binPlaceHolder(WasteType type) {
    return BinPlaceHolder(
      targetValue: type,
      onCorrectPlace: (value) {
        controller.onCorrectPlace(context);
      },
      onWrongPlace: (value) {
        controller.onWrongPlace();
      },
      showHint: controller.showHint,
    );
  }
}
