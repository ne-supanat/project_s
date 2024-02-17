import 'package:flutter/material.dart';
import 'package:project_s/pages/level_select_page_view.dart';
import 'package:project_s/pages/main_page_controller.dart';
import 'package:project_s/widgets/app_scaffold.dart';

import '../widgets/knowledge_dialog.dart';

class MainPageView extends StatelessWidget {
  MainPageView({super.key});

  final MainPageController controller = MainPageController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold<MainPageState>(
      controller: controller,
      body: layout,
    );
  }

  Widget layout(BuildContext context) {
    return Column(
      children: [
        FilledButton(
            onPressed: () {
              controller.addScore1();
            },
            child: const Text('1+')),
        FilledButton(
            onPressed: () {
              controller.addScore2();
            },
            child: const Text('2+')),
        Text(controller.state.counter1.toString()),
        Text(controller.state.counter2.toString()),
        FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LevelSelectPageView()),
              );
            },
            child: const Text('Levels')),
        FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LevelSelectPageView()),
              );
            },
            child: const Text('Chalenge')),
        FilledButton(
            onPressed: () {
              showDialog(context: context, builder: (context) => const KnowledgeDialog());
            },
            child: const Text('Knowledge')),
        FilledButton(
            onPressed: () {
              showDialog(context: context, builder: (context) => const KnowledgeDialog());
            },
            child: const Text('Tutorial')),
      ],
    );
  }
}
