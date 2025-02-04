import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_location/countries/north_america/canada.dart';
import 'package:toplife/game_systems/main_systems/system_school/util/get_precollege_school_name.dart';

void main() {
  group("getPrecollegeSchoolName: ", () {
    final chosenCountry = Canada();
    final String chosenState = chosenCountry.randomState;

    test(
      "given a state, country an lifestage we gen the correct precollege name",
      () => expect(
          getPrecollegeSchoolName(
            lifeStage: LifeStage.teen,
            stateString: chosenState,
            countryString: chosenCountry.name,
          ),
          "$chosenState High School"),
    );
  });
}
