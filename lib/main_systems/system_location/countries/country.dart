import 'dart:collection';

abstract class Country {
  String get name;
  List<String> get states;
  String get randomState;
  String get currency;
  // bool get abortionLaw;
  HashSet<String> get femaleFirstNames;
  String get randomFemaleFirstName;
  HashSet<String> get maleFirstNames;
  String get randomMaleFirstName;
  HashSet<String> get lastNames;
  String get randomLastName;
  bool get requiresCarInsurance;
}
