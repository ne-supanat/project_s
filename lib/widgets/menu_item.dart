import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onTap,
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        widget.text,
        style: AppTextStyle.base.semibold.copyWith(
          fontSize: 20,
        ),
      ),
    );
  }
}
