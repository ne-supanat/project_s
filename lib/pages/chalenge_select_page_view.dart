import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';
import '../constants/chalenge_level.dart';
import '../constants/color_name.dart';
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
              Text('- Difficulty -', style: AppTextStyle.base.size28.bold),
              const SizedBox(height: 24),
              chalengeItem(context, ChalengeLevel.beginner),
              const SizedBox(height: 16),
              chalengeItem(context, ChalengeLevel.normal),
              const SizedBox(height: 16),
              chalengeItem(context, ChalengeLevel.expert),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
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
