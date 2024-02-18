import 'package:flutter/material.dart';
import 'package:project_s/pages/game_page_view.dart';
import 'package:project_s/widgets/app_scaffold.dart';

import '../constants/level_resource.dart';
import '../widgets/app_back_button.dart';
import '../widgets/level_item.dart';

class LevelSelectPageView extends StatefulWidget {
  const LevelSelectPageView({super.key});

  @override
  State<LevelSelectPageView> createState() => _LevelSelectPageViewState();
}

class _LevelSelectPageViewState extends State<LevelSelectPageView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
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
            child: Scrollbar(
              controller: _scrollController,
              radius: const Radius.circular(8),
              thumbVisibility: true,
              trackVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
                  children: LevelResource().levels.keys.map((e) => levelItem(context, e)).toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const AppBackButton(),
          const SizedBox(height: 16),
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
