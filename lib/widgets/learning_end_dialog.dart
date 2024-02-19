import 'package:flutter/material.dart';
import '../constants/app_text_style.dart';
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
            score > 1
                ? 'Perfects'
                : score > 0
                    ? 'few mistake left'
                    : 'keep up',
            style: AppTextStyle.base.size28.semibold,
          ),
          const SizedBox(height: 8),
          StarRow(
            score: score,
            size: 56,
          ),
          const SizedBox(height: 8),
          MenuItem(
            onTap: onPlayAgain,
            text: 'Play Again',
          ),
          const SizedBox(height: 8),
          MenuItem(
            onTap: onBack,
            text: 'Back',
          ),
        ],
      ),
    );
  }
}
