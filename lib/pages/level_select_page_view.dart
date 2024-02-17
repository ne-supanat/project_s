import 'package:flutter/material.dart';
import 'package:project_s/pages/game_page_view.dart';
import 'package:project_s/widgets/app_scaffold.dart';

import '../constants/level_resource.dart';
import '../widgets/level_item.dart';

class LevelSelectPageView extends StatelessWidget {
  const LevelSelectPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: layout,
    );
  }

  Widget layout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BackButton(),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: LevelResource().levels.keys.map((e) => levelItem(context, e)).toList(),
        ),
      ],
    );
  }

  Widget levelItem(context, int level) {
    return LevelItem(
        level: level,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GamePageView(
                arguments: GamePageViewArguments(level: level),
              ),
            ),
          );
        });
  }
}
