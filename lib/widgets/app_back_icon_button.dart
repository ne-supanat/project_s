import 'package:flutter/material.dart';

import '../constants/color_name.dart';

class AppBackIconButton extends StatelessWidget {
  const AppBackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorNames.cream,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: ColorNames.black333335,
        icon: const Icon(Icons.arrow_back_rounded),
      ),
    );
  }
}
