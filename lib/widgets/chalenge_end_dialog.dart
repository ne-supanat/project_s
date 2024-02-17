import 'package:flutter/material.dart';

class ChalengeEndDialog extends StatelessWidget {
  const ChalengeEndDialog({
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
          const Text(
            'Good Job',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 8),
          Text(
            score.toString(),
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: onPlayAgain,
            child: const Text('play again'),
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: onBack,
            child: const Text('back'),
          )
        ],
      ),
    );
  }
}
