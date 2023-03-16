import 'dart:collection';

abstract class Country {
  String get name;
  List<String> get states;
  String get randomState;
  String get currency;
  int get economy;
  bool get abortionLaw;
  bool get hasFreeEducation;
  int get taxPercentage;
  bool get requiresCarInsurance;
  HashSet<String> get femaleFirstNames;
  String get randomFemaleFirstName;
  HashSet<String> get maleFirstNames;
  String get randomMaleFirstName;
  HashSet<String> get lastNames;
  String get randomLastName;
}
