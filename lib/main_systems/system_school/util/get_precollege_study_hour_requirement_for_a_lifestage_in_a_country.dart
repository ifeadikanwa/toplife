import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_school/constants/precollege_study_hour_requirement.dart';

int getPrecollegeStudyHourRequirementForALifeStageInACountry({
  required LifeStage lifeStage,
  required String countryString,
}) {
  final Country country = LocationManager.getCountryClass(
    countryName: countryString,
  );

  final PrecollegeStudyHourRequirement countryPrecollegeStudyHourRequirement =
      country.precollegeStudyHourRequirement;

  switch (lifeStage) {
    case LifeStage.toddler:
      return countryPrecollegeStudyHourRequirement.toddler;

    case LifeStage.child:
      return countryPrecollegeStudyHourRequirement.child;

    case LifeStage.teen:
      return countryPrecollegeStudyHourRequirement.teen;

    default:
      return 0;
  }
}
