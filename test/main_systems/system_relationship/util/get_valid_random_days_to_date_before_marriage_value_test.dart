import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_relationship/util/get_valid_random_days_to_date_before_marriage_value.dart';

void main() {
  group("Get valid random days to date before marriage value:", () {
    test(
        "minimum days to date before marriage is 5",
        () => expect(
              minDaysBeforeMarriage,
              5,
            ));

    test(
        "maximum days to date before marriage is 50",
        () => expect(
              maxDaysBeforeMarriage,
              50,
            ));

    test(
        "value returned is withing the range 5 - 50",
        () => expect(
              getValidRandomDaysToDateBeforeMarriageValue(),
              inClosedOpenRange(
                5,
                50,
              ),
            ));
  });
}
