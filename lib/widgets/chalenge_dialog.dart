import 'package:flutter/material.dart';

import '../constants/chalenge_level.dart';

class ChalengeDialog extends StatelessWidget {
  const ChalengeDialog({super.key, required this.onSetupChalenge});

  final Function(ChalengeLevel) onSetupChalenge;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Pick difficulty',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 8),
          FilledButton(
              onPressed: () {
                onSetupChalenge(ChalengeLevel.beginner);
                Navigator.pop(context);
              },
              child: const Text('Beginner')),
          const SizedBox(height: 8),
          FilledButton(
              onPressed: () {
                onSetupChalenge(ChalengeLevel.normal);
                Navigator.pop(context);
              },
              child: const Text('Normal')),
          const SizedBox(height: 8),
          FilledButton(
              onPressed: () {
                onSetupChalenge(ChalengeLevel.expert);
                Navigator.pop(context);
              },
              child: const Text('Expert')),
        ],
      ),
    );
  }
}
