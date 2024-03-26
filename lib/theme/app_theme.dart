import 'package:flutter/material.dart';
import 'package:nsafeclass/theme/pallete.dart';

class AppTheme {
  static ThemeData theme = ThemeData().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Pallete.backgroundColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.blueColor,
    ),
  );
}
