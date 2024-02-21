import 'dart:collection';
import 'package:toplife/main_systems/system_location/constants/default.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/main_systems/system_person/constants/appearance/skin_color.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_body_location.dart';
import 'package:toplife/main_systems/system_school/constants/precollege_naming_suffix.dart';
import 'package:toplife/main_systems/system_school/constants/precollege_study_hour_requirement.dart';

class Canada implements Country {
  @override
  String get currency => Default.defaultNorthAmericanCurrency;

  @override
  String get name => "Canada";

  @override
  List<String> get states =>
      ["Ontario", "Quebec", "Alberta", "British Columbia", "Saskatchewan"];

  @override
  int get economy => 2;

  @override
  HashSet<SkinColor> get dominantSkinColors =>
      Default.canadaAndUSDominantSkinColors;

  @override
  int get diversityChance => 30;

  @override
  int get chanceAnyPersonHasTattoo =>
      Default.canadaAndUSChanceAnyPersonHasTattoo;

  @override
  int get chanceFemalePersonHasPiercing =>
      Default.canadaAndUSChanceFemalePersonHasPiercing;

  @override
  int get chanceMalePersonHasPiercing =>
      Default.canadaAndUSChanceMalePersonHasPiercing;

  @override
  List<PiercingBodyLocation> get culturallyPopularPiercingLocations =>
      Default.canadaAndUSCulturallyPopularPiercingLocations;

  @override
  String get randomState {
    return getRandomValueFromList(list: states);
  }

  @override
  HashSet<String> get femaleFirstNames =>
      Default.defaultFemaleEnglishFirstNames;

  @override
  String get randomFemaleFirstName {
    return getRandomValueFromSet(set: femaleFirstNames);
  }

  @override
  HashSet<String> get lastNames => Default.defaultEnglishLastNames;

  @override
  String get randomLastName {
    return getRandomValueFromSet(set: lastNames);
  }

  @override
  HashSet<String> get maleFirstNames => Default.defaultMaleEnglishFirstNames;

  @override
  String get randomMaleFirstName {
    return getRandomValueFromSet(set: maleFirstNames);
  }

  @override
  PrecollegeNamingSuffix get precollegeNamingSuffix =>
      PrecollegeNamingSuffix.american;

  @override
  PrecollegeStudyHourRequirement get precollegeStudyHourRequirement =>
      PrecollegeStudyHourRequirement.regular;

  @override
  bool get requiresCarInsurance => true;

  @override
  bool get abortionLaw => true;

  @override
  bool get hasFreeEducation => false;

  @override
  int get taxPercentage => 15;
}
