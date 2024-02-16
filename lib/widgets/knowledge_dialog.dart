import 'package:flutter/material.dart';

class KnowledgeDialog extends StatelessWidget {
  const KnowledgeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [CloseButton()],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(200, (int index) => Text('text'))
                        .toList(), //TODO: add content
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
