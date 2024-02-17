import 'package:flutter/material.dart';

class ChalengeEndDialog extends StatelessWidget {
  const ChalengeEndDialog({super.key, required this.score});

  final num score;

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
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('close'),
          )
        ],
      ),
    );
  }
}
