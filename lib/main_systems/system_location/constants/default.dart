import 'dart:collection';

import 'package:toplife/main_systems/system_location/constants/currency.dart';
import 'package:toplife/main_systems/system_location/constants/names/english_names.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/skin_color.dart';

class Default {
  //Currency
  static const defaultNorthAmericanCurrency = Currency.dollar;
  static const defaultEuropeanCurrency = Currency.euro;

  //Economy
  static const defaultNorthAmericanEconomy = 2;
  static const defaultEuropeanEconomy = 3;

  //names
  static final HashSet<String> defaultFemaleEnglishFirstNames =
      femaleEnglishNames;
  static final HashSet<String> defaultMaleEnglishFirstNames = maleEnglishNames;
  static final HashSet<String> defaultEnglishLastNames = englishLastNames;

  //skin color
  static final HashSet<SkinColor> canadaAndUSDominantSkinColors = HashSet.of({
    SkinColor.ivory,
    SkinColor.sand,
    SkinColor.honey,
  });
}
