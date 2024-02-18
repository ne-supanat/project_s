import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_name.dart';

class AppTextStyle {
  static TextStyle get base => GoogleFonts.quicksand().size16.regular.black;
}

extension TextStyleHelpers on TextStyle {
  TextStyle get size16 => copyWith(fontSize: 16);
  TextStyle get size24 => copyWith(fontSize: 24);
  TextStyle get size28 => copyWith(fontSize: 28);

  TextStyle get black => copyWith(color: ColorNames.black);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}
