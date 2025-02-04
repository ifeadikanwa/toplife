import 'dart:collection';

import 'package:toplife/game_systems/main_systems/system_person/constants/appearance/skin_color.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/piercing/piercing_body_location.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/precollege_naming_suffix.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/precollege_study_hour_requirement.dart';

abstract interface class Country {
  String get name;

  List<String> get states;

  String get randomState;

  String get currency;

  int get economy;

  PrecollegeNamingSuffix get precollegeNamingSuffix;

  PrecollegeStudyHourRequirement get precollegeStudyHourRequirement;

  HashSet<SkinColor> get dominantSkinColors;

  int get diversityChance; //chance a generated person was not born in this country
  int get chanceAnyPersonHasTattoo; //chance a generated person has tattoo
  int get chanceFemalePersonHasPiercing; //chance a generated female person has tattoo
  int get chanceMalePersonHasPiercing; //chance a generated male person has tattoo
  List<PiercingBodyLocation> get culturallyPopularPiercingLocations;

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
