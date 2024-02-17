import 'package:flutter/material.dart';

import '../constants/chalenge_level.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/chalenge_item.dart';
import 'game_page_view.dart';

class ChalengeSelectPageView extends StatelessWidget {
  const ChalengeSelectPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: layout,
    );
  }

  Widget layout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackButton(),
          const SizedBox(height: 24),
          chalengeItem(context, ChalengeLevel.beginner),
          const SizedBox(height: 16),
          chalengeItem(context, ChalengeLevel.normal),
          const SizedBox(height: 16),
          chalengeItem(context, ChalengeLevel.expert),
        ],
      ),
    );
  }

  Widget chalengeItem(context, ChalengeLevel level) {
    return ChalengeItem(
        level: level,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GamePageView(
                arguments: GamePageViewArguments(chalengeLevel: level),
              ),
            ),
          );
        });
  }
}
