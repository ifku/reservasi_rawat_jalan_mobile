import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/fonts.gen.dart';

import 'color.dart';

class RRJThemeData {
  RRJThemeData._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: false,
      canvasColor: RRJColors.background,
      colorScheme: const ColorScheme.light(
        /*Core*/
        brightness: Brightness.light,
        background: RRJColors.background,
        onBackground: RRJColors.blue900,
        scrim: RRJColors.black,
        shadow: RRJColors.grey900,
        /*Surface*/
        surface: RRJColors.white,
        onSurface: RRJColors.grey700,
        surfaceVariant: RRJColors.grey100,
        inverseSurface: RRJColors.azure900,
        onInverseSurface: RRJColors.azure100,
        onSurfaceVariant: RRJColors.grey700,
        /*Primary*/
        primary: RRJColors.blue500,
        onPrimary: RRJColors.blue100,
        primaryContainer: RRJColors.blue200,
        onPrimaryContainer: RRJColors.blue800,
        inversePrimary: RRJColors.azure200,
        /*Secondary*/
        secondary: RRJColors.teal500,
        onSecondary: RRJColors.white,
        secondaryContainer: RRJColors.teal300,
        onSecondaryContainer: RRJColors.teal900,
        /*Tertiary*/
        tertiary: RRJColors.yellow500,
        onTertiary: RRJColors.white,
        tertiaryContainer: RRJColors.yellow300,
        onTertiaryContainer: RRJColors.yellow900,
        /*Error*/
        error: RRJColors.rose500,
        onError: RRJColors.white,
        errorContainer: RRJColors.rose300,
        onErrorContainer: RRJColors.yellow900,
        /*Outline*/
        outline: RRJColors.grey400,
        outlineVariant: RRJColors.grey200,
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
    canvasColor: RRJColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      /*Core*/
      brightness: Brightness.dark,
      background: RRJColors.grey800,
      onBackground: RRJColors.grey200,
      scrim: RRJColors.black,
      shadow: RRJColors.black,
      /*Surface*/
      surface: RRJColors.grey700,
      onSurface: RRJColors.white,
      surfaceVariant: RRJColors.grey600,
      surfaceTint: RRJColors.grey200,
      inverseSurface: RRJColors.grey300,
      onInverseSurface: RRJColors.grey900,
      onSurfaceVariant: RRJColors.grey200,
      /*Primary*/
      primary: RRJColors.blue500,
      onPrimary: RRJColors.white,
      primaryContainer: RRJColors.grey200,
      onPrimaryContainer: RRJColors.grey200,
      inversePrimary: RRJColors.grey500,
      /*Secondary*/
      secondary: RRJColors.teal500,
      onSecondary: RRJColors.teal900,
      secondaryContainer: RRJColors.teal800,
      onSecondaryContainer: RRJColors.teal300,
      /*Tertiary*/
      tertiary: RRJColors.yellow500,
      onTertiary: RRJColors.yellow900,
      tertiaryContainer: RRJColors.yellow800,
      onTertiaryContainer: RRJColors.yellow300,
      /*Error*/
      error: RRJColors.rose500,
      onError: RRJColors.white,
      onErrorContainer: RRJColors.rose900,
      /*Outline*/
      outline: RRJColors.grey500,
      outlineVariant: RRJColors.grey200,
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
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: RRJFonts.sfPro,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: RRJFonts.sfPro,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
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
      fontWeight: FontWeight.w500,
      fontFamily: RRJFonts.sfPro,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: RRJFonts.sfPro,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: RRJFonts.sfPro,
    ),
  );
}
