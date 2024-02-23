import 'package:flutter/material.dart';
import 'package:project_s/constants/waste_type.dart';

import '../constants/app_text_style.dart';
import '../constants/color_name.dart';
import '../models/waste_model.dart';

class WasteCard extends StatelessWidget {
  const WasteCard({super.key, required this.value, required this.showHint});

  final WasteModel value;
  final bool showHint;

  @override
  Widget build(BuildContext context) {
    final scale = (MediaQuery.of(context).size.width / 500) * 0.7;
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Draggable<WasteModel>(
        data: value,
        dragAnchorStrategy: (object, context, offset) {
          return const Offset(66, 90);
        },
        childWhenDragging: Opacity(
          opacity: 1,
          child: _content(),
        ),
        feedback: Opacity(
          opacity: 0.5,
          child: Material(
            color: Colors.transparent,
            child: Transform.scale(
              scale: scale < 1 ? scale : 0.9,
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
            color: ColorNames.cream,
            borderRadius: BorderRadius.circular(outerCircular),
            border: Border.all(
              color: ColorNames.black,
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
                    height: 30,
                    color: ColorNames.black333335,
                    padding: const EdgeInsets.all(4.0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        value.name,
                        style: AppTextStyle.base.size18.bold.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: ColorNames.cream),
                          ),
                          Image.network(
                            value.imagePath,
                            fit: BoxFit.contain,
                          ),
                        ],
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
          ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3, color: Colors.white),
                color: value.category.color,
              ),
              width: 25,
              height: 25,
            )
          : const SizedBox(),
    );
  }
}
