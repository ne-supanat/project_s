import 'package:flutter/material.dart';
import 'package:project_s/pages/level_select_page_view.dart';
import 'package:project_s/pages/main_page_controller.dart';
import 'package:project_s/widgets/app_scaffold.dart';
import 'package:project_s/widgets/menu_item.dart';

import '../constants/app_text_style.dart';
import '../constants/color_name.dart';
import '../widgets/knowledge_dialog.dart';
import 'chalenge_select_page_view.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  final MainPageController controller = MainPageController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold<MainPageState>(
      controller: controller,
      body: layout,
    );
  }

  Widget layout(BuildContext context) {
    return Container(
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
          Text(
            'Project S',
            style: AppTextStyle.base.copyWith(
              fontSize: 56,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          MenuItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LevelSelectPageView()),
              );
            },
            text: 'Levels',
          ),
          const SizedBox(height: 16),
          MenuItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChalengeSelectPageView()),
              );
            },
            text: 'Chalenge',
          ),
          const SizedBox(height: 16),
          MenuItem(
            onTap: () {
              showDialog(context: context, builder: (context) => const KnowledgeDialog());
            },
            text: 'Knowledge',
          ),
          const SizedBox(height: 16),
          MenuItem(
            onTap: () {},
            text: 'Tutorial',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
