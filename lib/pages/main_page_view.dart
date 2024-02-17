import 'package:flutter/material.dart';
import 'package:project_s/pages/level_select_page_view.dart';
import 'package:project_s/pages/main_page_controller.dart';
import 'package:project_s/widgets/app_scaffold.dart';

import '../widgets/knowledge_dialog.dart';
import 'chalenge_select_page_view.dart';

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
                MaterialPageRoute(builder: (context) => const ChalengeSelectPageView()),
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
              // showDialog(context: context, builder: (context) => const KnowledgeDialog());
            },
            child: const Text('Tutorial')),
      ],
    );
  }
}
