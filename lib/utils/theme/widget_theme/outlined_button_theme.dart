import 'package:flutter/material.dart';
import 'package:piggy/constants/colors.dart';
import 'package:piggy/constants/sizes.dart';

class MyOutlinedButtonTheme {
  MyOutlinedButtonTheme._();

  //light theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(mButtonRadius))),
        padding: const EdgeInsets.symmetric(vertical: mButtonHeight)
    ),
  );

  //dart theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(mButtonRadius))),
        padding: const EdgeInsets.symmetric(vertical: mButtonHeight)
    ),
  );
}