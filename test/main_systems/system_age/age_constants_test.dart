import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_age/age_constants.dart';

void main() {
  group("Age Constants:", () {
    //new days lived
    test(
      "new baby days lived is 0",
      () => expect(
        AgeConstants.newBabyDaysLived,
        0,
      ),
    );

    test(
      "new toddler days lived is 8",
      () => expect(
        AgeConstants.newToddlerDaysLived,
        8,
      ),
    );

    test(
      "new child days lived is 15",
      () => expect(
        AgeConstants.newChildDaysLived,
        15,
      ),
    );

    test(
      "new teen days lived is 29",
      () => expect(
        AgeConstants.newTeenDaysLived,
        29,
      ),
    );

    test(
      "new young adult days lived is 50",
      () => expect(
        AgeConstants.newYoungAdultDaysLived,
        50,
      ),
    );

    test(
      "new adult days lived is 92",
      () => expect(
        AgeConstants.newAdultDaysLived,
        92,
      ),
    );

    test(
      "new elder days lived is 155",
      () => expect(
        AgeConstants.newElderDaysLived,
        155,
      ),
    );

    //max days lived
    test(
      "max baby days lived is 7",
      () => expect(
        AgeConstants.babyMaxDaysLived,
        7,
      ),
    );

    test(
      "max toddler days lived is 14",
      () => expect(
        AgeConstants.toddlerMaxDaysLived,
        14,
      ),
    );

    test(
      "max child days lived is 28",
      () => expect(
        AgeConstants.childMaxDaysLived,
        28,
      ),
    );

    test(
      "max teen days lived is 49",
      () => expect(
        AgeConstants.teenMaxDaysLived,
        49,
      ),
    );

    test(
      "max young adult days lived is 91",
      () => expect(
        AgeConstants.youngAdultMaxDaysLived,
        91,
      ),
    );

    test(
      "max adult days lived is 154",
      () => expect(
        AgeConstants.adultMaxDaysLived,
        154,
      ),
    );

    test(
      "max elder days lived is 196",
      () => expect(
        AgeConstants.elderMaxDaysLived,
        196,
      ),
    );
  });
}
