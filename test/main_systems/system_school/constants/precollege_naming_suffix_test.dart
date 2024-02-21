import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/precollege_naming_suffix.dart';

void main() {
  group("Precollege Naming Suffix:", () {
    test(
        "american toddler, child and teen precollege naming suffix are correct",
        () {
      expect(
        PrecollegeNamingSuffix.american.toddler,
        "Elementary School",
        reason: "toddler",
      );

      expect(
        PrecollegeNamingSuffix.american.child,
        "Middle School",
        reason: "child",
      );

      expect(
        PrecollegeNamingSuffix.american.teen,
        "High School",
        reason: "teen",
      );
    });

    test(
        "european toddler, child and teen precollege naming suffix are correct",
        () {
      expect(
        PrecollegeNamingSuffix.european.toddler,
        "Nursery School",
        reason: "toddler",
      );

      expect(
        PrecollegeNamingSuffix.european.child,
        "Primary School",
        reason: "child",
      );

      expect(
        PrecollegeNamingSuffix.european.teen,
        "Secondary School",
        reason: "teen",
      );
    });
  });
}
