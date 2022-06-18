import 'dart:collection';

import 'package:toplife/main_systems/system_location/constants/currency.dart';
import 'package:toplife/main_systems/system_location/constants/names/english_names.dart';

class Default {
  //Currency
  static const defaultNorthAmericanCurrency = Currency.dollar;
  static const defaultEuropeanCurrency = Currency.euro;

  static final HashSet<String> defaultFemaleEnglishFirstNames = femaleEnglishNames;
  static final HashSet<String> defaultMaleEnglishFirstNames = maleEnglishNames;
  static final HashSet<String> defaultEnglishLastNames = englishLastNames;
}
