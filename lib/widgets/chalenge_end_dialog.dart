import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';
import '../generated/l10n.dart';
import 'menu_item.dart';

class ChalengeEndDialog extends StatelessWidget {
  const ChalengeEndDialog({
    super.key,
    required this.score,
    required this.highScore,
    required this.onPlayAgain,
    required this.onBack,
  });

  final num score;
  final num highScore;
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
            S.of(context).chalenge_end_dialog_score,
            style: AppTextStyle.base.size24.semibold,
          ),
          const SizedBox(height: 4),
          Text(
            score.toString(),
            style: AppTextStyle.base.bold.copyWith(fontSize: 48),
          ),
          const SizedBox(height: 4),
          Text(
            score > highScore
                ? S.of(context).chalenge_end_dialog_new_high_score
                : '${S.of(context).chalenge_end_dialog_high_score_is}$highScore',
            style: AppTextStyle.base,
          ),
          const SizedBox(height: 16),
          MenuItem(
            onTap: onPlayAgain,
            text: S.of(context).chalenge_end_dialog_play_again,
          ),
          const SizedBox(height: 8),
          MenuItem(
            onTap: onBack,
            text: S.of(context).chalenge_end_dialog_back,
          ),
        ],
      ),
    );
  }
}
