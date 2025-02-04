import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/piercing/piercing_body_location.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/piercing_utils.dart';

void main() {
  group("Piercing Utils:", () {
    group("getPiercingBasePrice:", () {
      test(
          "given a tongue piercing location, we get a value within the correct range",
          () {
        const PiercingBodyLocation chosenLocation = PiercingBodyLocation.tongue;

        final int result = PiercingUtils.getPiercingBasePrice(
          chosenLocation: chosenLocation,
        );

        //-5% of base price
        final int lowestPossibleBasePrice =
            (chosenLocation.basePrice - (chosenLocation.basePrice * (5 / 100)))
                .ceil();

        //+5% of base price
        final int highestPossibleBasePrice =
            (chosenLocation.basePrice + (chosenLocation.basePrice * (5 / 100)))
                .ceil();

        expect(
            result,
            inInclusiveRange(
              lowestPossibleBasePrice,
              highestPossibleBasePrice,
            ));
      });
    });
    group("getRandomPiercing:", () {
      test("returns tattoo with valid values", () {
        const int personID = 3;
        const int dayObtained = 6;

        final Piercing result = PiercingUtils.getRandomPiercing(
            dayObtained: dayObtained, personID: personID, chosenLocation: null);

        expect(
          result.personId,
          personID,
          reason: "Cause: personId",
        );

        expect(
          result.dayObtained,
          dayObtained,
          reason: "Cause: dayObtained",
        );

        expect(
          PiercingBodyLocation.values.asNameMap()[result.location],
          isNotNull,
          reason: "Cause: location",
        );
      });
    });
  });
}
