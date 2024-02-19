import 'package:flutter/material.dart';
import 'package:project_s/pages/game_page_view.dart';
import 'package:project_s/widgets/app_scaffold.dart';

import '../constants/game_mode.dart';
import '../widgets/app_back_button.dart';
import '../widgets/level_item.dart';
import 'level_select_page_controller.dart';

class LevelSelectPageView extends StatefulWidget {
  const LevelSelectPageView({super.key});

  @override
  State<LevelSelectPageView> createState() => _LevelSelectPageViewState();
}

class _LevelSelectPageViewState extends State<LevelSelectPageView> {
  final LevelSelectPageController controller = LevelSelectPageController();

  @override
  void initState() {
    super.initState();
    controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      controller: controller,
      body: layout,
    );
  }

  Widget layout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Builder(builder: (context) {
                return Center(
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.start,
                    spacing: 8,
                    children: controller.levels.keys
                        .map((e) => levelItem(context, e, controller.levels[e] ?? 0))
                        .toList(),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
          const AppBackButton(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget levelItem(context, int level, int score) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: LevelItem(
          level: level,
          score: score,
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GamePageView(
                  arguments: GamePageViewArguments(gameMode: GameMode.learning, level: level),
                ),
              ),
            );
            controller.load();
          }),
    );
  }
}
