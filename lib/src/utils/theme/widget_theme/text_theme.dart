import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piggy/src/constants/sizes.dart';

class MyTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineSmall: GoogleFonts.montserrat(color: Colors.black87, fontSize: mFontSizeXLarge),
    bodyLarge: GoogleFonts.montserrat(color: Colors.black54, fontSize: mFontSizeLarge),
    bodyMedium: GoogleFonts.montserrat(color: Colors.black87, fontSize: mFontSizeMedium),
    bodySmall: GoogleFonts.montserrat(color: Colors.black87, fontSize: mFontSizeSmall),
  );
  static TextTheme darkTextTheme = TextTheme(
    headlineSmall: GoogleFonts.montserrat(color: Colors.black87, fontSize: mFontSizeXLarge),
    bodyLarge: GoogleFonts.montserrat(color: Colors.black54, fontSize: mFontSizeLarge),
    bodyMedium: GoogleFonts.montserrat(color: Colors.black87, fontSize: mFontSizeMedium),
    bodySmall: GoogleFonts.montserrat(color: Colors.black87, fontSize: mFontSizeSmall),
  );
}