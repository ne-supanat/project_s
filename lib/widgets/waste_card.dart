import 'package:flutter/material.dart';

import '../models/waste_model.dart';

class WasteCard extends StatelessWidget {
  const WasteCard({super.key, required this.value, required this.showHint});

  final WasteModel value;
  final bool showHint;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Draggable<WasteModel>(
        data: value,
        childWhenDragging: Opacity(
          opacity: 1,
          child: _content(),
        ),
        feedback: Opacity(
          opacity: 0.5,
          child: Material(
            color: Colors.transparent,
            child: Transform.scale(
              scale: 0.9,
              child: _content(),
            ),
          ),
        ),
        child: _content(),
      ),
    );
  }

  _content() {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.blue,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value.name),
              if (showHint) Text(value.category.name),
            ],
          ),
        ));
  }
}
