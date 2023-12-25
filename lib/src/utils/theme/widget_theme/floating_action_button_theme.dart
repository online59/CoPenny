import 'package:flutter/material.dart';

class MyFloatingActionButtonTheme {
  MyFloatingActionButtonTheme._();

  static const lightFloatingActionButtonTheme = FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(90.0),
      ),
    ),
  );

  static const darkFloatingActionButtonTheme = FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(90.0),
      ),
    ),
  );
}