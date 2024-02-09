import 'package:flutter/material.dart';
import 'package:piggy/src/utils/theme/widget_theme/appbar_theme.dart';
import 'package:piggy/src/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:piggy/src/utils/theme/widget_theme/floating_action_button_theme.dart';
import 'package:piggy/src/utils/theme/widget_theme/outlined_button_theme.dart';
import 'package:piggy/src/utils/theme/widget_theme/text_field_theme.dart';
import 'package:piggy/src/utils/theme/widget_theme/text_theme.dart';

class MyAppTheme {
  MyAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueGrey,
      brightness: Brightness.light,
    ),
    textTheme: MyTextTheme.lightTextTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.lightInputDecorationTheme,
    floatingActionButtonTheme: MyFloatingActionButtonTheme.lightFloatingActionButtonTheme,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blueGrey,
      brightness: Brightness.dark,
    ),
    textTheme: MyTextTheme.darkTextTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.darkInputDecorationTheme,
    floatingActionButtonTheme: MyFloatingActionButtonTheme.darkFloatingActionButtonTheme,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
  );
}
