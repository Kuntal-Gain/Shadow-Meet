import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle({
  required double size,
  required Color color,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.urbanist(
      textStyle: TextStyle(
    fontSize: size,
    fontWeight: fontWeight,
    color: color,
  ));
}
