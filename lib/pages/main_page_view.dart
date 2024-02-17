import 'package:flutter/material.dart';
import 'package:project_s/constants/waste_resource.dart';
import 'package:project_s/pages/level_select_page_view.dart';
import 'package:project_s/pages/main_page_controller.dart';
import 'package:project_s/widgets/app_scaffold.dart';
import 'package:project_s/widgets/menu_item.dart';

import '../widgets/knowledge_dialog.dart';
import '../widgets/waste_card.dart';
import 'chalenge_select_page_view.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class MainPageView extends StatelessWidget {
  // MainPageView({super.key});

  bool showhint = true;

  final MainPageController controller = MainPageController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold<MainPageState>(
      controller: controller,
      body: layout,
    );
  }

  Widget layout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Switch(
              value: showhint,
              onChanged: (v) {
                setState(() {
                  showhint = v;
                });
              }),
          WasteCard(
            showHint: showhint,
            value: WasteResource().all.first,
          ),
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
        ],
      ),
    );
  }
}
