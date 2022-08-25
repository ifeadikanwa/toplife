import 'package:flutter/material.dart';
import 'package:toplife/config/theme/colors.dart';

class AppTheme {
  static const appFont = 'Ubuntu';

  static final pastelOrangeTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: darkPastelOrange,
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: darkPastelOrange,
      onPrimary: Colors.black,
      secondary: pastelYellow,
      onSecondary: Colors.black,
      tertiary: lightPastelOrange,
      onTertiary: Colors.black,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: darkPastelOrange,
    ),
  );

  static final cottonCandyTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: pastelBlue,
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: pastelBlue,
      onPrimary: Colors.black,
      secondary: pastelPink,
      onSecondary: Colors.black,
      tertiary: Colors.white,
      onTertiary: Colors.black,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: pastelBlue,
    ),
  );

  static final pastelPinkTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: beige,
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: beige,
      onPrimary: Colors.black,
      secondary: pastelPink,
      onSecondary: Colors.black,
      tertiary: matteOrange,
      onTertiary: Colors.black,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: beige,
    ),
  );

  static final shadesOfOrangeTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: offWhite,
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: offWhite,
      onPrimary: Colors.black,
      secondary: lightPastelOrange,
      onSecondary: Colors.black,
      tertiary: matteOrange,
      onTertiary: Colors.black,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: lightPastelOrange,
    ),
  );

  static final shadesOfAquaTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: offWhite,
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: offWhite,
      onPrimary: Colors.black,
      secondary: pastelAqua,
      onSecondary: Colors.black,
      tertiary: deepSkyBlue,
      onTertiary: Colors.black,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: pastelAqua,
    ),
  );

  static final darkThemeBlueprint = ThemeData(
    brightness: Brightness.dark,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: darkThemeBlack,
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: darkThemeBlack,
      onPrimary: Colors.white,
      secondary: lightBlack,
      onSecondary: Colors.white,
      tertiary: Colors.grey,
      onTertiary: Colors.white,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: lightBlack,
    ),
  );

  static final darkOrangeTheme = darkThemeBlueprint.copyWith(
    colorScheme: darkThemeBlueprint.colorScheme.copyWith(
      tertiary: matteOrange,
    ),
  );

  static final darkPinkTheme = darkThemeBlueprint.copyWith(
    colorScheme: darkThemeBlueprint.colorScheme.copyWith(
      tertiary: mattePink,
    ),
  );

  static final darkBlueTheme = darkThemeBlueprint.copyWith(
    colorScheme: darkThemeBlueprint.colorScheme.copyWith(
      tertiary: deepSkyBlue,
    ),
  );

  // static final darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   fontFamily: appFont,
  //   primaryColor: darkGrey,
  //   colorScheme: const ColorScheme.dark(
  //     secondary: Colors.orange,
  //     surface: lightGrey,
  //   ),
  // );
}
