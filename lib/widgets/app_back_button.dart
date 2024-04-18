import 'package:flutter/material.dart';

import '../constants/app_text_style.dart';
import '../constants/color_name.dart';
import '../generated/l10n.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
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
        S.of(context).common_back,
        style: AppTextStyle.base.semibold.copyWith(
          fontSize: 20,
        ),
      ),
    );
  }
}
