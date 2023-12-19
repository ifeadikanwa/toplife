import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/util/stance_utils.dart';

void main() {
  group("Stance utils:", () {
    test(
      "default chance value is 70",
      () => expect(
        StanceUtils.defaultChanceValue,
        70,
      ),
    );

    test(
      "bigger chance value is 90",
      () => expect(
        StanceUtils.biggerChanceValue,
        90,
      ),
    );
    test("getValidStanceValue returns true or false only", () {
      final bool result = StanceUtils.getValidStanceValue();
      assert(result == true || result == false);
    });

    group("Get valid random days to date before marriage value:", () {
      test(
          "minimum days to date before marriage is 5",
          () => expect(
                StanceUtils.minDaysBeforeMarriage,
                5,
              ));

      test(
          "maximum days to date before marriage is 50",
          () => expect(
                StanceUtils.maxDaysBeforeMarriage,
                50,
              ));

      test(
          "value returned is withing the range 5 - 50",
          () => expect(
                StanceUtils.getValidRandomDaysToDateBeforeMarriageValue(),
                inClosedOpenRange(
                  5,
                  50,
                ),
              ));
    });
  });
}
