import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/fonts.gen.dart';

import 'color.dart';

class RRJThemeData {
  RRJThemeData._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: false,
      canvasColor: RRJColors.grey100,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: RRJColors.blue500,
        secondary: RRJColors.teal500,
        tertiary: RRJColors.grey500,
        background: RRJColors.grey100,
        error: RRJColors.rose500,
        errorContainer: RRJColors.rose100,
        inversePrimary: RRJColors.grey100,
        onPrimary: Colors.white,
        onSecondary: RRJColors.grey100,
        onBackground: RRJColors.grey700,
        inverseSurface: RRJColors.grey100,
        onError: Colors.white,
        onSurface: RRJColors.grey700,
        primaryContainer: RRJColors.blue100,
        onErrorContainer: RRJColors.rose100,
        onInverseSurface: RRJColors.grey700,
        onPrimaryContainer: RRJColors.blue700,
        onSecondaryContainer: RRJColors.teal700,
        onSurfaceVariant: RRJColors.grey500,
        onTertiary: RRJColors.grey700,
        onTertiaryContainer: RRJColors.grey100,
        outline: RRJColors.blue500,
        surface: RRJColors.grey100,
        outlineVariant: RRJColors.blue300,
        scrim: RRJColors.grey900,
        secondaryContainer: RRJColors.teal100,
        shadow: RRJColors.grey300,
        surfaceTint: RRJColors.grey200,
        surfaceVariant: RRJColors.grey200,
        tertiaryContainer: RRJColors.grey100,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(color: RRJColors.grey700),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: RRJColors.blue500,
        unselectedItemColor: RRJColors.grey300,
      ),
      textTheme: textTheme());

  static ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: RRJColors.blue500,
      secondary: RRJColors.teal500,
      tertiary: RRJColors.grey500,
      background: RRJColors.grey100,
      error: RRJColors.rose500,
      errorContainer: RRJColors.rose100,
      inversePrimary: RRJColors.grey100,
      onPrimary: Colors.white,
      onSecondary: RRJColors.grey100,
      onBackground: RRJColors.grey700,
      inverseSurface: RRJColors.grey100,
      onError: Colors.white,
      onSurface: RRJColors.grey700,
      primaryContainer: RRJColors.blue100,
      onErrorContainer: RRJColors.rose100,
      onInverseSurface: RRJColors.grey700,
      onPrimaryContainer: RRJColors.blue700,
      onSecondaryContainer: RRJColors.teal700,
      onSurfaceVariant: RRJColors.grey500,
      onTertiary: RRJColors.grey700,
      onTertiaryContainer: RRJColors.grey100,
      outline: RRJColors.blue500,
      surface: RRJColors.grey100,
      outlineVariant: RRJColors.blue300,
      scrim: RRJColors.grey900,
      secondaryContainer: RRJColors.teal100,
      shadow: RRJColors.grey300,
      surfaceTint: RRJColors.grey200,
      surfaceVariant: RRJColors.grey200,
      tertiaryContainer: RRJColors.grey100,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: RRJColors.grey700,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: RRJColors.grey700,
      elevation: 0,
      selectedItemColor: RRJColors.blue500,
      unselectedItemColor: RRJColors.grey300,
    ),
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w600,
      fontFamily: RRJFonts.sfPro,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w700,
      fontFamily: RRJFonts.sfPro,
    ),
    displaySmall: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w500,
      fontFamily: RRJFonts.sfPro,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontFamily: RRJFonts.sfPro,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      fontFamily: RRJFonts.sfPro,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: RRJFonts.sfPro,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      fontFamily: RRJFonts.sfPro,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: RRJFonts.sfPro,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: RRJFonts.sfPro,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: RRJFonts.sfPro,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: RRJFonts.sfPro,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      fontFamily: RRJFonts.sfPro,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: RRJFonts.sfPro,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: RRJFonts.sfPro,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: RRJFonts.sfPro,
    ),
  );
}
