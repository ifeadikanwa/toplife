import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_school/util/get_precollege_naming_suffix_for_a_lifestage_in_a_country.dart';

String getPrecollegeSchoolName({
  required LifeStage lifeStage,
  required String stateString,
  required String countryString,
}) {
  //get precollege naming suffix
  final String precollegeNamingSuffix =
      getPrecollegeNamingSuffixForALifeStageInACountry(
    lifeStage: lifeStage,
    countryString: countryString,
  );

  //return name
  return "$stateString $precollegeNamingSuffix";
}
