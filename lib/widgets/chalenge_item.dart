import 'package:flutter/material.dart';
import 'package:project_s/constants/chalenge_level.dart';

import '../constants/app_text_style.dart';

class ChalengeItem extends StatefulWidget {
  const ChalengeItem({super.key, required this.level, required this.onTap});

  final ChalengeLevel level;
  final Function() onTap;

  @override
  State<ChalengeItem> createState() => _ChalengeItemState();
}

class _ChalengeItemState extends State<ChalengeItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onTap,
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        widget.level.name,
        style: AppTextStyle.base.size24.bold,
      ),
    );
  }
}
