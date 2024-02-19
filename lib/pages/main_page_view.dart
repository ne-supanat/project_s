import 'package:flutter/material.dart';
import 'package:project_s/helpers/translations.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {});
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold<MainPageState>(
      controller: controller,
      body: layout,
    );
  }

  Widget layout(BuildContext context) {
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
              Text(
                TranslationKeys.common_title,
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
                text: TranslationKeys.main_page_learning,
              ),
              const SizedBox(height: 16),
              MenuItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChalengeSelectPageView()),
                  );
                },
                text: TranslationKeys.main_page_chalenge,
              ),
              const SizedBox(height: 16),
              MenuItem(
                onTap: () {
                  showDialog(context: context, builder: (context) => const KnowledgeDialog());
                },
                text: TranslationKeys.main_page_knowledge,
              ),
              const SizedBox(height: 16),
              MenuItem(
                onTap: () {},
                text: TranslationKeys.main_page_tutorial,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
