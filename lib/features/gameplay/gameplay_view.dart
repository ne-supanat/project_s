import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_s/widgets/app_scaffold.dart';
import '../../constants/app_text_style.dart';

import '../../constants/chalenge_level.dart';
import '../../constants/color_name.dart';
import '../../constants/waste_type.dart';
import '../../generated/l10n.dart';
import '../../widgets/app_back_icon_button.dart';
import '../../widgets/bin_placeholder.dart';
import '../../widgets/knowledge_dialog.dart';
import '../../widgets/waste_card.dart';
import 'gameplay_bloc.dart';

class GameplayViewArguments {
  final int? level;
  final ChalengeLevel? chalengeLevel;

  GameplayViewArguments({this.level, this.chalengeLevel});
}

class GameplayView extends StatefulWidget {
  const GameplayView({super.key, required this.arguments});

  final GameplayViewArguments arguments;

  @override
  State<GameplayView> createState() => _GameplayViewState();
}

class _GameplayViewState extends State<GameplayView> with SingleTickerProviderStateMixin {
  final GameplayBloc controller = GameplayBloc();

  @override
  void initState() {
    super.initState();
    controller.init(context, widget.arguments, this);
  }

  @override
  void dispose() {
    controller.dipose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      providers: [
        BlocProvider<GameplayBloc>(
          create: (BuildContext context) => controller,
        ),
      ],
      body: layout,
    );
  }

  Widget layout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _gui(),
          const SizedBox(height: 24),
          FittedBox(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                border: Border.all(
                  width: 4,
                  color: ColorNames.black.withOpacity(0.4),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: _content(),
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
                          child: _blocBuilder(
                            buildWhen: (previous, current) => previous.score != current.score,
                            builder: (context, state) {
                              return Text(
                                '${S.of(context).game_page_score}${state.score}',
                                style: AppTextStyle.base.semibold,
                              );
                            },
                          )),
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
      onPressed: () async {
        controller.updateShowKnowledge(true);
        await showDialog(context: context, builder: (c) => const KnowledgeDialog());
        controller.updateShowKnowledge(false);
      },
      icon: Icons.menu_book_rounded,
    );
  }

  _hint() {
    return _blocBuilder(
      buildWhen: (previous, current) => previous.showHint != current.showHint,
      builder: (context, state) {
        return _helperButton(
          onPressed: () {
            controller.updateShowHint(!state.showHint);
          },
          icon: state.showHint ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        );
      },
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

  _content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (controller.chalengeLevel != null)
          SizedBox(
              width: 500,
              child: _blocBuilder(
                buildWhen: (previous, current) =>
                    previous.timeRemainPercentage != current.timeRemainPercentage,
                builder: (context, state) {
                  return LinearProgressIndicator(
                    value: controller.timeRemainPercentageAnimation.value.toDouble(),
                    minHeight: 12,
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red.shade400,
                  );
                },
              )),
        const SizedBox(height: 16),
        SizedBox(
          width: 500,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _danger(),
              _cardHeap(),
              _general(),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _recycle(),
      ],
    );
  }

  _cardHeap() {
    return _blocBuilder(
      buildWhen: (previous, current) => previous.cardChanged(current),
      builder: (context, state) {
        return AnimatedScale(
          scale: state.cardScale,
          duration: const Duration(milliseconds: 100),
          curve: Curves.ease,
          child: AnimatedSlide(
            offset: state.cardSlide,
            duration: const Duration(milliseconds: 100),
            curve: Curves.ease,
            child: AnimatedSlide(
              offset: state.shakeOffset,
              duration: const Duration(milliseconds: 50),
              curve: Curves.ease,
              child: state.queue.isNotEmpty
                  ? _blocBuilder(
                      buildWhen: (previous, current) => previous.showHint != current.showHint,
                      builder: (context, state) {
                        return WasteCard(
                          value: state.queue.first,
                          showHint: state.showHint,
                        );
                      },
                    )
                  : const SizedBox(),
            ),
          ),
        );
      },
    );
  }

  _danger() {
    return _categoryZone(
      category: WasteCategory.danger,
      child: Column(
        children: [
          _binPlaceHolder(WasteType.hazardous),
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
          const SizedBox(width: 16),
          _binPlaceHolder(WasteType.glass),
        ],
      ),
    );
  }

  _general() {
    return Column(children: [
      _categoryZone(
        category: WasteCategory.general,
        child: _binPlaceHolder(WasteType.general),
      ),
      const SizedBox(height: 8, width: 8),
      _categoryZone(
        category: WasteCategory.organic,
        child: _binPlaceHolder(WasteType.organic),
      ),
    ]);
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
    return _blocBuilder(
      buildWhen: (previous, current) => previous.showHint != current.showHint,
      builder: (context, state) {
        return BinPlaceHolder(
          targetValue: type,
          onCorrectPlace: (value) {
            controller.onCorrectPlace(context);
          },
          onWrongPlace: (value) {
            controller.onWrongPlace();
          },
          showHint: state.showHint,
        );
      },
    );
  }

  _blocBuilder({
    bool Function(GameplayState previous, GameplayState current)? buildWhen,
    required Widget Function(BuildContext context, GameplayState state) builder,
  }) {
    return BlocBuilder<GameplayBloc, GameplayState>(
      buildWhen: buildWhen,
      builder: builder,
    );
  }
}
