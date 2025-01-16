import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/get_precollege_study_hour_requirement_for_a_lifestage_in_a_country.dart';

void main() {
  group("getPrecollegeStudyHourRequirementForALifeStageInACountry: ", () {
    final chosenCountry = Canada();

    test(
        "every lifestage returns the correct precollege study hour requirement",
        () {
      for (var lifestage in LifeStage.values) {
        final int result =
            getPrecollegeStudyHourRequirementForALifeStageInACountry(
          lifeStage: lifestage,
          countryString: chosenCountry.name,
        );

        switch (lifestage) {
          case LifeStage.baby:
            expect(result, 0);
          case LifeStage.toddler:
            expect(
                result, chosenCountry.precollegeStudyHourRequirement.toddler);

          case LifeStage.child:
            expect(result, chosenCountry.precollegeStudyHourRequirement.child);

          case LifeStage.teen:
            expect(result, chosenCountry.precollegeStudyHourRequirement.teen);

          case LifeStage.youngAdult:
            expect(result, 0);

          case LifeStage.adult:
            expect(result, 0);

          case LifeStage.elder:
            expect(result, 0);
        }
      }
    });
  });
}
