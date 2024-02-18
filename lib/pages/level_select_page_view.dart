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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: LevelResource().levels.keys.map((e) => levelItem(context, e)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget levelItem(context, int level) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: LevelItem(
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
          }),
    );
  }
}
