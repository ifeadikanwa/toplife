import 'package:flutter/material.dart';
import 'package:toplife/config/theme/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Ubuntu',
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.white,
      onPrimary: Colors.black,
      surface: Colors.white,
      secondary: brightPurple,
    ),
  );

  // static final darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   fontFamily: 'Ubuntu',
  //   primaryColor: darkGrey,
  //   colorScheme: const ColorScheme.dark(
  //     secondary: Colors.orange,
  //     surface: lightGrey,
  //   ),
  // );
}
