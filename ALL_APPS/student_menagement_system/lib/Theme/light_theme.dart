import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xff10b981),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff10b981),
      foregroundColor: Colors.white,
    ),

    cardColor: Colors.white,

    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff10b981)),
  );
}
