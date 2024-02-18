import 'package:flutter/material.dart';
import 'package:project_s/constants/app_text_style.dart';

import '../constants/color_name.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // shape: BoxShape.circle,
          // color: ColorNames.cream,
          ),
      child: OutlinedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            backgroundColor: ColorNames.cream,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99),
            ),
            side: const BorderSide(width: 3, color: ColorNames.black)),
        child: Text(
          'Back',
          style: AppTextStyle.base.semibold.copyWith(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
