import 'package:flutter/material.dart';

import 'color_name.dart';

class AppTextStyle {
  static TextStyle get base => const TextStyle(fontFamily: 'Quicksand').size16.regular.black;
}

extension TextStyleHelpers on TextStyle {
  TextStyle get size16 => copyWith(fontSize: 16);
  TextStyle get size18 => copyWith(fontSize: 18);
  TextStyle get size24 => copyWith(fontSize: 24);
  TextStyle get size28 => copyWith(fontSize: 28);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get black => copyWith(color: ColorNames.black);
  TextStyle get white => copyWith(color: ColorNames.white);
}
