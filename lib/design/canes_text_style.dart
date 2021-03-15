import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'canes_color.dart';
import 'canes_spacing.dart';

class CanesTextStyle {
  static final boldM = GoogleFonts.ubuntu(
      textStyle: TextStyle(
    color: CanesColor.defaultColor,
    fontSize: CanesSpacing.spacing50,
    fontWeight: FontWeight.bold,
  ));

  static final boldL = GoogleFonts.ubuntu(
      textStyle: TextStyle(
    color: CanesColor.defaultColor,
    fontSize: CanesSpacing.spacing75,
    fontWeight: FontWeight.bold,
  ));

  static final buttonLabelM = GoogleFonts.ubuntu(
      textStyle: TextStyle(
    color: CanesColor.defaultColor,
    fontSize: CanesSpacing.spacing50,
    fontWeight: FontWeight.bold,
  ));

  static final buttonLabelL = GoogleFonts.ubuntu(
      textStyle: TextStyle(
    color: CanesColor.defaultColor,
    fontSize: CanesSpacing.spacing75,
    fontWeight: FontWeight.bold,
  ));
}
