import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_shop_and_storage/constants/stay_type.dart';

void main() {
  group("Stay Type:", () {
    test("stay type has 4 constant values",
        () => expect(StayType.values.length, 4));

    test("visit presentation name is Visitor",
        () => expect(StayType.visit.presentationName, "Visitor"));

    test(
        "temporary presentation name is Temporary Occupant",
        () =>
            expect(StayType.temporary.presentationName, "Temporary Occupant"));

    test("indefinitely presentation name is Occupant",
        () => expect(StayType.indefinitely.presentationName, "Occupant"));

    test("roommate presentation name is Roommate",
        () => expect(StayType.roommate.presentationName, "Roommate"));
  });
}
