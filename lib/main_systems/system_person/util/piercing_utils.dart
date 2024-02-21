import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/get_random_value_from_collections.dart';
import 'package:toplife/core/utils/numbers/fluctuate_number.dart';
import 'package:toplife/main_systems/system_person/constants/piercing/piercing_body_location.dart';

class PiercingUtils {
  static Piercing getRandomPiercing({
    required int personID,
    required int dayObtained,
    required PiercingBodyLocation? chosenLocation,
  }) {
    return Piercing(
      id: DatabaseConstants.dummyId,
      personId: personID,
      location: chosenLocation?.name ??
          getRandomValueFromList<PiercingBodyLocation>(
                  list: PiercingBodyLocation.values)
              .name,
      dayObtained: dayObtained,
    );
  }

  static int getPiercingBasePrice({
    required PiercingBodyLocation chosenLocation,
  }) {
    //return fluctuated base price of piercing body location
    return fluctuateNumber(
      number: chosenLocation.basePrice.toDouble(),
      maxPercentage: 5,
      canBeNegativeFluctuation: true,
    ).ceil();
  }
}
