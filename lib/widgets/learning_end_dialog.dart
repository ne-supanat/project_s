import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';
import '../helpers/translations.dart';
import 'menu_item.dart';
import 'start_item.dart';

class LearningEndDialog extends StatelessWidget {
  const LearningEndDialog({
    super.key,
    required this.score,
    required this.onPlayAgain,
    required this.onBack,
  });

  final num score;
  final Function() onPlayAgain;
  final Function() onBack;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            score == 3
                ? TranslationKeys.learning_end_dialog_star3
                : score == 2
                    ? TranslationKeys.learning_end_dialog_star2
                    : score == 1
                        ? TranslationKeys.learning_end_dialog_star1
                        : TranslationKeys.learning_end_dialog_star0,
            style: AppTextStyle.base.size24.semibold,
            textAlign: TextAlign.center,
          ),
          Text(
            score == 3
                ? TranslationKeys.learning_end_dialog_star3_sub
                : score == 2
                    ? TranslationKeys.learning_end_dialog_star2_sub
                    : score == 1
                        ? TranslationKeys.learning_end_dialog_star1_sub
                        : TranslationKeys.learning_end_dialog_star0_sub,
            style: AppTextStyle.base.size16.semibold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          StarRow(
            score: score,
            size: 48,
          ),
          const SizedBox(height: 8),
          MenuItem(
            onTap: onPlayAgain,
            text: TranslationKeys.learning_end_dialog_play_again,
          ),
          const SizedBox(height: 8),
          MenuItem(
            onTap: onBack,
            text: TranslationKeys.learning_end_dialog_back,
          ),
        ],
      ),
    );
  }
}
