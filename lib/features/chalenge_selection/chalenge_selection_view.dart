import 'package:flutter/material.dart';

import '../../constants/app_text_style.dart';
import '../../constants/chalenge_level.dart';
import '../../constants/color_name.dart';
import '../../generated/l10n.dart';
import '../../widgets/app_back_button.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/chalenge_item.dart';
import '../gameplay/gameplay_view.dart';

class ChalengeSelectionView extends StatelessWidget {
  const ChalengeSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: layout,
    );
  }

  Widget layout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                  S.of(context).chalenge_level_select_page_title,
                  style: AppTextStyle.base.size28.bold,
                ),
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
          const SizedBox(height: 16),
          const AppBackButton()
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
              builder: (context) => GameplayView(
                arguments: GameplayViewArguments(chalengeLevel: level),
              ),
            ),
          );
        });
  }
}
