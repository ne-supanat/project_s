import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project_s/constants/waste_type.dart';
import 'package:project_s/widgets/waste_card.dart';

import '../models/waste_model.dart';

class BinPlaceHolder extends StatefulWidget {
  const BinPlaceHolder({
    super.key,
    required this.targetValue,
    required this.onCorrectPlace,
    required this.onWrongPlace,
    required this.showHint,
  });

  final WasteType targetValue;
  final Function(WasteModel) onCorrectPlace;
  final Function(WasteModel) onWrongPlace;
  final bool showHint;

  @override
  State<BinPlaceHolder> createState() => _BinPlaceHolderState();
}

class _BinPlaceHolderState extends State<BinPlaceHolder> {
  Offset starOffset = const Offset(0, 1);
  double starSize = 0;

  WasteModel? tempWaste;

  late double rotate;

  @override
  void initState() {
    super.initState();
    rotate = randomRotate;
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<WasteModel>(
      onWillAccept: (value) {
        return true;
      },
      onAccept: (value) {
        if (value.type == widget.targetValue) {
          widget.onCorrectPlace(value);
          shake();
        } else {
          widget.onWrongPlace(value);
        }
        setState(() {
          tempWaste = null;
        });
      },
      onMove: (d) {
        if (tempWaste != d.data) {
          setState(() {
            tempWaste = d.data;
          });
        }
      },
      onLeave: (_) {
        setState(() {
          tempWaste = null;
        });
      },
      builder: (context, candidates, rejects) {
        return DottedBorder(
          color: Colors.white.withOpacity(0.5),
          strokeWidth: 4,
          strokeCap: StrokeCap.round,
          dashPattern: const [10],
          radius: const Radius.circular(16),
          borderType: BorderType.RRect,
          child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.recycling_rounded),
                      Text(widget.targetValue.name),
                    ],
                  ),
                  AnimatedSlide(
                    offset: starOffset,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                    child: AnimatedScale(
                      scale: starSize,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                      child: const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                  ),
                  if (tempWaste != null)
                    Positioned(
                      top: -40,
                      left: -18,
                      child: Transform.scale(
                        scale: 0.5,
                        child: Transform.rotate(
                          angle: rotate,
                          child: SizedBox(
                              height: 180,
                              width: 132,
                              child: WasteCard(value: tempWaste!, showHint: widget.showHint)),
                        ),
                      ),
                    ),
                ],
              )),
        );
      },
    );
  }

  void shake() async {
    setState(() {
      starOffset = const Offset(0, -1);
      starSize = 2;
    });

    await Future.delayed(const Duration(milliseconds: 750));

    setState(() {
      starOffset = const Offset(0, -0.2);
      starSize = 0;
    });

    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      starOffset = const Offset(0, 1);
    });
  }

// -0.15 & 0.15 & ~0.0
  double get randomRotate =>
      pi * (((Random().nextDouble() * 0.14) + 0.01) * (Random().nextBool() ? 1 : -1));
}
