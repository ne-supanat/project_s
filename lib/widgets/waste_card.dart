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
    const height = 180.0;
    const width = 132.0;
    const outerCircular = 16.0;
    const innerCircular = 8.0;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(outerCircular),
            border: Border.all(
              color: Colors.black,
              width: 4,
            ),
          ),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(innerCircular),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.blue,
                    padding: const EdgeInsets.all(4.0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        value.name,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey.shade100,
                      child: Image.network(
                        'https://picsum.photos/500',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        _hint(),
      ],
    );
  }

  _hint() {
    return Positioned(
      bottom: 8,
      right: 8,
      child: showHint
          ? ClipOval(
              child: Container(
                width: 25,
                height: 25,
                color: Colors.red.shade400,
              ),
            )
          //  FittedBox(
          //   fit: BoxFit.scaleDown,
          //   child: Container(
          //     padding: const EdgeInsets.all(4),
          //     alignment: Alignment.center,
          //     width: width,
          //     decoration: const BoxDecoration(
          //       color: Colors.blue,
          //       borderRadius: BorderRadius.vertical(
          //           bottom: Radius.circular(innerCircular)),
          //     ),
          //     child: Text(
          //       value.category.name,
          //       style:
          //           const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          : const SizedBox(),
    );
  }
}
