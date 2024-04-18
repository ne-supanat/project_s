import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_text_style.dart';
import '../../constants/color_name.dart';
import '../../generated/l10n.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/knowledge_dialog.dart';
import '../../widgets/menu_item.dart';
import '../../widgets/tutorial_dialog.dart';
import '../chalenge_selection/chalenge_selection_view.dart';
import '../level_selection/level_selection_view.dart';
import 'main_menu_bloc.dart';

class MainMenuView extends StatefulWidget {
  const MainMenuView({super.key});

  @override
  State<MainMenuView> createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenuView> {
  final MainMenuBloc controller = MainMenuBloc();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      controller.onReady(context);
    });
    WidgetsBinding.instance.addObserver(AppLifecycleListener(
      onPause: () async {
        controller.bgAudioHelper.pause();
      },
      onResume: () async {
        controller.bgAudioHelper.resume();
      },
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.start,
      child: AppScaffold(
        providers: [
          BlocProvider<MainMenuBloc>(
            create: (BuildContext context) => controller,
          ),
        ],
        body: layout,
      ),
    );
  }

  Widget layout(BuildContext context) {
    return ListenableBuilder(
        listenable: controller.focusNode,
        builder: (BuildContext context, Widget? child) {
          return BlocBuilder<MainMenuBloc, MainMenuState>(
            buildWhen: (previous, current) => previous.started != current.started,
            builder: (context, state) {
              return SingleChildScrollView(child: state.started ? _menuLayout() : _startLayout());
            },
          );
        });
  }

  _startLayout() {
    return Focus(
      focusNode: controller.focusNode,
      onKeyEvent: controller.handleKeyEvent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).main_page_start,
            style: AppTextStyle.base.semibold.white.copyWith(
              fontSize: 28,
              shadows: const [Shadow(color: ColorNames.black, blurRadius: 10)],
            ),
          ),
        ],
      ),
    );
  }

  _menuLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorNames.cream,
            border: Border.all(width: 4, color: ColorNames.black),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        S.of(context).common_title,
                        style: AppTextStyle.base.bold.copyWith(
                          fontSize: 56,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MenuItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LevelSelectionView()),
                  );
                },
                text: S.of(context).main_page_learning,
              ),
              const SizedBox(height: 16),
              MenuItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChalengeSelectionView()),
                  );
                },
                text: S.of(context).main_page_chalenge,
              ),
              const SizedBox(height: 16),
              MenuItem(
                onTap: () {
                  showDialog(context: context, builder: (context) => const KnowledgeDialog());
                },
                text: S.of(context).main_page_knowledge,
              ),
              const SizedBox(height: 16),
              MenuItem(
                onTap: () {
                  showDialog(context: context, builder: (context) => const TutorialDialog());
                },
                text: S.of(context).main_page_tutorial,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
