import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff121212),

    primaryColor: const Color(0xff10b981),

    cardColor: const Color(0xff1e1e1e),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff10b981),
      foregroundColor: Colors.white,
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff10b981),
      brightness: Brightness.dark,
    ),
  );
}
