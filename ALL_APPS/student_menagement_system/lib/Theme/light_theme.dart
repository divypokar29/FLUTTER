import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: const Color(0xFFF97316),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF97316),
      foregroundColor: Colors.white,
    ),

    cardColor: Colors.white,

    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF97316)),
  );
}
