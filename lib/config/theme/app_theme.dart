import 'package:flutter/material.dart';
import 'package:toplife/config/theme/colors.dart';

class AppTheme {
  static const appFont = 'Ubuntu';

  //LIGHT THEMES

  //?
  // static final pastelOrangeTheme = ThemeData(
  //   brightness: Brightness.light,
  //   fontFamily: appFont,
  //   primaryColor: Colors.white,
  //   scaffoldBackgroundColor: darkPastelOrange,
  //   iconTheme: const IconThemeData(color: Colors.black),
  //   colorScheme: const ColorScheme.light(
  //     brightness: Brightness.light,
  //     primary: darkPastelOrange,
  //     onPrimary: Colors.black,
  //     secondary: pastelYellow,
  //     onSecondary: Colors.black,
  //     tertiary: lightPastelOrange,
  //     onTertiary: Colors.black,
  //     surface: Colors.white,
  //   ),
  //   cardTheme: const CardTheme(
  //     color: darkPastelOrange,
  //   ),
  // );

  //
  // static final cottonCandyTheme = ThemeData(
  //   brightness: Brightness.light,
  //   fontFamily: appFont,
  //   primaryColor: Colors.white,
  //   scaffoldBackgroundColor: pastelBlue,
  //   iconTheme: const IconThemeData(color: Colors.black),
  //   colorScheme: const ColorScheme.light(
  //     brightness: Brightness.light,
  //     primary: pastelBlue,
  //     onPrimary: Colors.black,
  //     secondary: pastelPink,
  //     onSecondary: Colors.black,
  //     tertiary: Colors.white,
  //     onTertiary: Colors.black,
  //     surface: Colors.white,
  //   ),
  //   cardTheme: const CardTheme(
  //     color: pastelBlue,
  //   ),
  // );

  //approved
  static final pastelPinkTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: beige,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkPink,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(color: darkPink),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: beige,
      onPrimary: Colors.black,
      secondary: pastelPink,
      onSecondary: Colors.black,
      tertiary: darkPink,
      onTertiary: Colors.black,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: beige,
    ),
  );

  //approved
  static final shadesOfOrangeTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: offWhite,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: matteOrange,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(color: matteOrange),
      ),
    ),
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

  //approved
  static final shadesOfAquaTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: offWhite,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: deepSkyBlue,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(color: deepSkyBlue),
      ),
    ),
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

  //
  static final sereneTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: whiteChocolate,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkCambridgeBlue,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(color: darkCambridgeBlue),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: whiteChocolate,
      onPrimary: Colors.black,
      secondary: cambridgeBlue,
      onSecondary: Colors.black,
      tertiary: darkCambridgeBlue,
      onTertiary: Colors.black,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: whiteChocolate,
    ),
  );

  //approved
  static final oceanBlueTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: lightCoolBlue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkCeruleanBlue,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(color: darkCeruleanBlue),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: lightCoolBlue,
      onPrimary: Colors.black,
      secondary: aeroBlue,
      onSecondary: Colors.black,
      tertiary: darkCeruleanBlue,
      onTertiary: Colors.black,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: lightCoolBlue,
    ),
  );

  //approved
  static final vintageBrownTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: crayola,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: firebrickRed,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(color: firebrickRed),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: crayola,
      onPrimary: Colors.black,
      secondary: ruddyBrown,
      onSecondary: Colors.black,
      tertiary: firebrickRed,
      onTertiary: Colors.black,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: crayola,
    ),
  );

  //approved
  static final shadesOfPinkTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: mistyRosePink,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: paradisePink,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(color: paradisePink),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: mistyRosePink,
      onPrimary: Colors.black,
      secondary: persianPink,
      onSecondary: Colors.black,
      tertiary: paradisePink,
      onTertiary: Colors.black,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: mistyRosePink,
    ),
  );

  //approved
  static final shadesOfGreenTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: appFont,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: almondWhite,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: jungleGreen,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(color: jungleGreen),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: almondWhite,
      onPrimary: Colors.black,
      secondary: middleGreen,
      onSecondary: Colors.black,
      tertiary: jungleGreen,
      onTertiary: Colors.black,
      surface: Colors.white,
    ),
    cardTheme: const CardTheme(
      color: almondWhite,
    ),
  );

  //DARK THEMES
  static final darkThemeBlueprint = ThemeData(
    brightness: Brightness.dark,
    fontFamily: appFont,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: darkThemeBlack,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.grey),
      ),
    ),
    tabBarTheme: const TabBarTheme(labelColor: Colors.white),
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

  //approved
  static final darkOrangeTheme = darkThemeBlueprint.copyWith(
    colorScheme: darkThemeBlueprint.colorScheme.copyWith(
      tertiary: matteOrange,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: matteOrange,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: matteOrange),
      ),
    ),
  );
  //approved
  static final darkPinkTheme = darkThemeBlueprint.copyWith(
    colorScheme: darkThemeBlueprint.colorScheme.copyWith(
      tertiary: mattePink,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: mattePink,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: mattePink),
      ),
    ),
  );

  //approved
  static final darkBlueTheme = darkThemeBlueprint.copyWith(
    colorScheme: darkThemeBlueprint.colorScheme.copyWith(
      tertiary: deepSkyBlue,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: deepSkyBlue,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: deepSkyBlue),
      ),
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
