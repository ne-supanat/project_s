import 'package:flutter/material.dart';
import 'package:project_s/constants/app_text_style.dart';

import '../constants/color_name.dart';

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
      onPressed: () {},
      style: TextButton.styleFrom(
        surfaceTintColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        widget.text,
        style: AppTextStyle.base.copyWith(
          color: ColorNames.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
