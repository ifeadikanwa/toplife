import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/get_precollege_naming_suffix_for_a_lifestage_in_a_country.dart';

void main() {
  group("getPrecollegeNamingSuffixForALifeStageInACountry: ", () {
    final chosenCountry = Canada();

    test("every lifestage returns the correct precollege naming suffix", () {
      for (var lifestage in LifeStage.values) {
        final String result = getPrecollegeNamingSuffixForALifeStageInACountry(
          lifeStage: lifestage,
          countryString: chosenCountry.name,
        );

        switch (lifestage) {
          case LifeStage.baby:
            expect(result, "");
          case LifeStage.toddler:
            expect(result, "Elementary School");

          case LifeStage.child:
            expect(result, "Middle School");

          case LifeStage.teen:
            expect(result, "High School");

          case LifeStage.youngAdult:
            expect(result, "");

          case LifeStage.adult:
            expect(result, "");

          case LifeStage.elder:
            expect(result, "");
        }
      }
    });
  });
}
