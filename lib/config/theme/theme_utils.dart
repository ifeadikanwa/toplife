import 'package:flutter/material.dart';
import 'package:toplife/config/theme/colors.dart';

class ThemeUtils {
  static const appFont = 'Ubuntu';

  //
  static InputDecorationTheme getInputDecorationTheme({
    required Color tertiaryColor,
  }) {
    return InputDecorationTheme(
      border: const UnderlineInputBorder(),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: tertiaryColor,
        ),
      ),
    );
  }

  //
  static const lightThemeTextSelectionsThemeData = TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: Colors.white70,
    selectionHandleColor: Colors.black54,
  );

  //
  static final darkThemeTextSelectionsThemeData = TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionColor: Colors.grey.shade700,
    selectionHandleColor: Colors.grey.shade300,
  );

  //
  static ThemeData getLightThemeDataBasedOnColors({
    required Color primaryColor,
    required Color secondaryColor,
    required Color tertiaryColor,
    required Color cardBackgroundColor,
  }) {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: appFont,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: primaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: tertiaryColor,
          foregroundColor: Colors.white,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: BorderSide(color: tertiaryColor),
        ),
      ),
      inputDecorationTheme: ThemeUtils.getInputDecorationTheme(
        tertiaryColor: tertiaryColor,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: tertiaryColor,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      textSelectionTheme: lightThemeTextSelectionsThemeData,
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: Colors.black,
        secondary: secondaryColor,
        onSecondary: Colors.black,
        tertiary: tertiaryColor,
        onTertiary: Colors.black,
        surface: Colors.white,
      ),
      cardTheme: CardTheme(
        color: cardBackgroundColor,
      ),
    );
  }

  //
  static ThemeData getDarkThemeDataBasedOnColors({
    required Color tertiaryColor,
  }) {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: appFont,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: darkThemeBlack,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: tertiaryColor,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: BorderSide(color: tertiaryColor),
        ),
      ),
      inputDecorationTheme: ThemeUtils.getInputDecorationTheme(
        tertiaryColor: tertiaryColor,
      ),
      tabBarTheme: const TabBarTheme(labelColor: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
      textSelectionTheme: ThemeUtils.darkThemeTextSelectionsThemeData,
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: darkThemeBlack,
        onPrimary: Colors.white,
        secondary: lightBlack,
        onSecondary: Colors.white,
        tertiary: tertiaryColor,
        onTertiary: Colors.white,
        surface: Colors.white,
      ),
      cardTheme: const CardTheme(
        color: lightBlack,
      ),
    );
  }
}
