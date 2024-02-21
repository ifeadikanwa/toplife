import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/main_systems/system_school/util/get_precollege_study_points_per_hour.dart';

void main() {
  group("getPrecollegeStudyPointsPerHour: ", () {
    final chosenCountry = Canada();

    test(
      "given a non precollege lifestage, we get 0",
      () => expect(
        getPrecollegeStudyPointsPerHour(
          precollegeLifeStage: LifeStage.adult,
          countryString: chosenCountry.name,
        ),
        0,
      ),
    );

    test("given a precollege lifestage, we get the correct result", () {
      final int result = getPrecollegeStudyPointsPerHour(
        precollegeLifeStage: LifeStage.child,
        countryString: chosenCountry.name,
      );

      final int correctResult = (100 /
              (chosenCountry.precollegeStudyHourRequirement.child *
                  LifeStage.child.stageDuration))
          .round();

      expect(result, correctResult);
    });
  });
}
