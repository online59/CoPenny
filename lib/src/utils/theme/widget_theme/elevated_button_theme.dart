import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';

class MyElevatedButtonTheme {
  MyElevatedButtonTheme._();

  //light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(mButtonRadiusSmall))),
        padding: const EdgeInsets.symmetric(vertical: mButtonHeight)),
  );

  //dart theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(mButtonRadiusSmall))),
        padding: const EdgeInsets.symmetric(vertical: mButtonHeight)),
  );
}
