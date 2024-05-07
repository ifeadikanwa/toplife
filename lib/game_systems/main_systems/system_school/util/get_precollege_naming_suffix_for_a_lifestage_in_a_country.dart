import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/country.dart';
import 'package:toplife/game_systems/main_systems/system_location/location_manager.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/precollege_naming_suffix.dart';

String getPrecollegeNamingSuffixForALifeStageInACountry({
  required LifeStage lifeStage,
  required String countryString,
}) {
  final Country country = LocationManager.getCountryClass(
    countryName: countryString,
  );

  final PrecollegeNamingSuffix countryPrecollegeNamingSuffix =
      country.precollegeNamingSuffix;

  switch (lifeStage) {
    case LifeStage.toddler:
      return countryPrecollegeNamingSuffix.toddler;

    case LifeStage.child:
      return countryPrecollegeNamingSuffix.child;

    case LifeStage.teen:
      return countryPrecollegeNamingSuffix.teen;

    default:
      return TextConstants.emptyString;
  }
}
