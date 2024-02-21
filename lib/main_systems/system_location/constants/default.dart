import 'dart:collection';

import 'package:toplife/main_systems/system_location/constants/currency.dart';
import 'package:toplife/main_systems/system_location/constants/names/english_names.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/skin_color.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_body_location.dart';

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

  //tattoo and piercings
  static const int canadaAndUSChanceAnyPersonHasTattoo = 30;

  static const int canadaAndUSChanceFemalePersonHasPiercing = 70;

  static const int canadaAndUSChanceMalePersonHasPiercing = 15;

  static const List<PiercingBodyLocation>
      canadaAndUSCulturallyPopularPiercingLocations = [
    PiercingBodyLocation.ears,
    PiercingBodyLocation.leftNostril,
    PiercingBodyLocation.rightNostril,
    PiercingBodyLocation.nasalSeptum,
  ];
}
