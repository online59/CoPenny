import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piggy/src/constants/sizes.dart';

class MyTextTheme {

  static TextStyle myTextStyle(double fontSize, Color color) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.rubik().fontFamily,
    );
  }

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: myTextStyle(mFontSizeXLarge, Colors.black87),
    headlineMedium: myTextStyle(mFontSizeLarge, Colors.black87),
    headlineSmall: myTextStyle(mFontSizeMedium, Colors.black87),
    bodyLarge: GoogleFonts.rubik(color: Colors.black87),
    bodyMedium: GoogleFonts.rubik(color: Colors.black87),
    bodySmall: GoogleFonts.rubik(color: Colors.black87),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: myTextStyle(mFontSizeXLarge, Colors.white70),
    headlineMedium: myTextStyle(mFontSizeLarge, Colors.white70),
    headlineSmall: myTextStyle(mFontSizeMedium, Colors.white70),
    bodyLarge: GoogleFonts.rubik(color: Colors.white70),
    bodyMedium: GoogleFonts.rubik(color: Colors.white70),
    bodySmall: GoogleFonts.rubik(color: Colors.white70),
  );
}
