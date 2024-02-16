import 'dart:math';

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
  WasteModel? tempWaste;

  @override
  Widget build(BuildContext context) {
    return DragTarget<WasteModel>(
      onWillAccept: (value) {
        return true;
      },
      onAccept: (value) {
        if (value.type == widget.targetValue) {
          widget.onCorrectPlace(value);
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
        return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(style: BorderStyle.solid, width: 2, color: Colors.blue),
              color: Colors.blue.withOpacity(0.2),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(widget.targetValue.name),
                ),
                if (tempWaste != null)
                  Transform.scale(
                    scale: 1.2,
                    child: Transform.rotate(
                      angle: randomRotate,
                      child: WasteCard(value: tempWaste!, showHint: widget.showHint),
                    ),
                  ),
              ],
            ));
      },
    );
  }

// -0.15 & 0.15 & ~0.0
  get randomRotate =>
      pi * (((Random().nextDouble() * 0.14) + 0.01) * (Random().nextBool() ? 1 : -1));
}
