import 'package:flutter/material.dart';

class AppTheme {
  // Core palette
  static const Color black       = Color(0xFF0A0A0A);
  static const Color darkGrey    = Color(0xFF1A1A1A);
  static const Color cardDark    = Color(0xFF222222);
  static const Color divider     = Color(0xFF2E2E2E);
  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecond  = Color(0xFFAAAAAA);
  static const Color textHint    = Color(0xFF666666);

  // Gold accent
  static const Color gold        = Color(0xFFD4AF37);
  static const Color goldLight   = Color(0xFFE8C84A);
  static const Color goldDark    = Color(0xFFB8960C);
  static const Color goldFade    = Color(0x22D4AF37);
  static const Color goldFade2   = Color(0x44D4AF37);

  // Status colors (muted for dark theme)
  static const Color green       = Color(0xFF4CAF7D);
  static const Color red         = Color(0xFFE05555);
  static const Color orange      = Color(0xFFE0913A);
  static const Color blue        = Color(0xFF5B8DEF);

  static ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: black,
    cardColor: cardDark,
    dividerColor: divider,
    colorScheme: const ColorScheme.dark(
      primary: gold,
      secondary: goldLight,
      surface: cardDark,
      background: black,
      onPrimary: black,
      onSurface: textPrimary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkGrey,
      foregroundColor: textPrimary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.3,
      ),
      iconTheme: IconThemeData(color: gold),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkGrey,
      selectedItemColor: gold,
      unselectedItemColor: textHint,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      color: cardDark,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: divider, width: 1),
      ),
      margin: EdgeInsets.zero,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkGrey,
      labelStyle: const TextStyle(color: textSecond),
      hintStyle: const TextStyle(color: textHint),
      prefixIconColor: gold,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: divider),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: divider),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: gold, width: 1.5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: gold,
        foregroundColor: black,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: gold,
        side: const BorderSide(color: gold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: gold),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith(
          (s) => s.contains(MaterialState.selected) ? gold : Colors.transparent),
      checkColor: MaterialStateProperty.all(black),
      side: const BorderSide(color: textHint),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: darkGrey,
      selectedColor: goldFade2,
      labelStyle: const TextStyle(color: textPrimary, fontSize: 13),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: divider),
      ),
    ),
    tabBarTheme: const TabBarTheme(
      indicatorColor: gold,
      labelColor: gold,
      unselectedLabelColor: textHint,
      indicatorSize: TabBarIndicatorSize.label,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: gold,
      foregroundColor: black,
      elevation: 4,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: cardDark,
      textStyle: TextStyle(color: textPrimary),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: cardDark,
      titleTextStyle: TextStyle(color: textPrimary, fontSize: 18, fontWeight: FontWeight.bold),
      contentTextStyle: TextStyle(color: textSecond),
    ),
    useMaterial3: true,
  );
}
