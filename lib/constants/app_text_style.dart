import 'package:flutter/material.dart';

import 'color_name.dart';

class AppTextStyle {
  static TextStyle get base => const TextStyle().black;
}

extension TextStyleHelpers on TextStyle {
  TextStyle get black => copyWith(color: ColorNames.black);
}
