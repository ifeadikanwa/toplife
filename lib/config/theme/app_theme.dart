import 'package:toplife/config/theme/colors.dart';
import 'package:toplife/config/theme/theme_utils.dart';

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
  static final pastelPinkTheme = ThemeUtils.getLightThemeDataBasedOnColors(
    primaryColor: beige,
    secondaryColor: pastelPink,
    tertiaryColor: darkPink,
    cardBackgroundColor: beige,
  );

  //approved
  static final shadesOfOrangeTheme = ThemeUtils.getLightThemeDataBasedOnColors(
    primaryColor: offWhite,
    secondaryColor: lightPastelOrange,
    tertiaryColor: matteOrange,
    cardBackgroundColor: lightPastelOrange,
  );

  //approved
  static final shadesOfAquaTheme = ThemeUtils.getLightThemeDataBasedOnColors(
    primaryColor: offWhite,
    secondaryColor: pastelAqua,
    tertiaryColor: deepSkyBlue,
    cardBackgroundColor: pastelAqua,
  );

  //
  static final sereneTheme = ThemeUtils.getLightThemeDataBasedOnColors(
    primaryColor: whiteChocolate,
    secondaryColor: cambridgeBlue,
    tertiaryColor: darkCambridgeBlue,
    cardBackgroundColor: whiteChocolate,
  );

  //approved
  static final oceanBlueTheme = ThemeUtils.getLightThemeDataBasedOnColors(
    primaryColor: lightCoolBlue,
    secondaryColor: aeroBlue,
    tertiaryColor: darkCeruleanBlue,
    cardBackgroundColor: lightCoolBlue,
  );

  //approved
  static final vintageBrownTheme = ThemeUtils.getLightThemeDataBasedOnColors(
    primaryColor: crayola,
    secondaryColor: ruddyBrown,
    tertiaryColor: firebrickRed,
    cardBackgroundColor: crayola,
  );

  //approved
  static final shadesOfPinkTheme = ThemeUtils.getLightThemeDataBasedOnColors(
    primaryColor: mistyRosePink,
    secondaryColor: persianPink,
    tertiaryColor: paradisePink,
    cardBackgroundColor: mistyRosePink,
  );

  //approved
  static final shadesOfGreenTheme = ThemeUtils.getLightThemeDataBasedOnColors(
    primaryColor: almondWhite,
    secondaryColor: middleGreen,
    tertiaryColor: jungleGreen,
    cardBackgroundColor: almondWhite,
  );

  //
  //
  //DARK THEMES

  //approved
  static final darkOrangeTheme = ThemeUtils.getDarkThemeDataBasedOnColors(
    tertiaryColor: matteOrange,
  );

  //approved
  static final darkPinkTheme = ThemeUtils.getDarkThemeDataBasedOnColors(
    tertiaryColor: mattePink,
  );

  //approved
  static final darkBlueTheme = ThemeUtils.getDarkThemeDataBasedOnColors(
    tertiaryColor: deepSkyBlue,
  );
}
