import 'dart:collection';

import 'package:toplife/main_systems/system_person/constants/appearance/skin_color.dart';

abstract class Country {
  String get name;
  List<String> get states;
  String get randomState;
  String get currency;
  int get economy;
  HashSet<SkinColor> get dominantSkinColors;
  int get diversityChance; //chance a generated person was not born in this country
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
