import 'package:flutter/material.dart';
import 'package:project_s/constants/color_name.dart';
import '../constants/app_text_style.dart';
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
            'Score',
            style: AppTextStyle.base.size24.semibold,
          ),
          const SizedBox(height: 4),
          Text(
            score.toString(),
            style: AppTextStyle.base.bold.copyWith(fontSize: 48),
          ),
          const SizedBox(height: 4),
          Text(
            score > highScore ? 'New High Score' : 'Your High Score is $highScore',
            style: AppTextStyle.base,
          ),
          const SizedBox(height: 16),
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
