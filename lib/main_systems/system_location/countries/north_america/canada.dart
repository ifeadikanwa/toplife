import 'dart:collection';
import 'package:toplife/main_systems/system_location/constants/default.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';

class Canada implements Country {
  @override
  String get currency => Default.defaultNorthAmericanCurrency;

  @override
  String get name => "Canada";

  @override
  List<String> get states =>
      ["Ontario", "Quebec", "Alberta", "British Columbia", "Saskatchewan"];

  @override
  String get randomState {
    return getRandomValueFromList(list: states);
  }

  @override
  HashSet<String> get femaleFirstNames =>
      Default.defaultFemaleEnglishFirstNames;

  @override
  String get randomFemaleFirstName {
    return getRandomValueFromHashSet(hashSet: femaleFirstNames);
  }

  @override
  HashSet<String> get lastNames => Default.defaultEnglishLastNames;

  @override
  String get randomLastName {
    return getRandomValueFromHashSet(hashSet: lastNames);
  }

  @override
  HashSet<String> get maleFirstNames => Default.defaultMaleEnglishFirstNames;

  @override
  String get randomMaleFirstName {
    return getRandomValueFromHashSet(hashSet: maleFirstNames);
  }
}
