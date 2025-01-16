import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/get_precollege_study_hour_requirement_for_a_lifestage_in_a_country.dart';

int getPrecollegeStudyPointsPerHour({
  required LifeStage precollegeLifeStage,
  required String countryString,
}) {
  //the expectation is that the player has to study the required hours everyday of the lifestage to get 100% course knowledge

  //get the required study hours
  final int requiredStudyHoursPerDay =
      getPrecollegeStudyHourRequirementForALifeStageInACountry(
    lifeStage: precollegeLifeStage,
    countryString: countryString,
  );

  //the total for the lifestage = lifestage duration * per day requirement
  final int totalRequiredStudyHours =
      precollegeLifeStage.stageDuration * requiredStudyHoursPerDay;

  //if total required hours will give you 100%
  //then 1 hour will give you:
  //(make sure you are not dividing by 0)
  final int studyPointPerHour = (totalRequiredStudyHours == 0)
      ? 0
      : (100 / totalRequiredStudyHours).round();

  return studyPointPerHour;
}
