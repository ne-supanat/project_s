import 'package:flutter/material.dart';
import 'package:project_s/constants/color_name.dart';

import '../constants/app_text_style.dart';

class LevelItem extends StatefulWidget {
  const LevelItem({super.key, required this.level, required this.onTap});

  final int level;
  final Function() onTap;

  @override
  State<LevelItem> createState() => _LevelItemState();
}

class _LevelItemState extends State<LevelItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      color: ColorNames.cream,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 4, color: ColorNames.black),
          ),
          child: Text(
            widget.level.toString(),
            style: AppTextStyle.base.size24.bold,
          ),
        ),
      ),
    );
  }
}
