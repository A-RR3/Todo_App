import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double kDefaultPadding = 20.0;

TextStyle textTheme(double size, FontWeight? weight, Color? color) {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: size,
          fontWeight: weight ?? FontWeight.w400,
          color: color ?? Colors.white));
}
