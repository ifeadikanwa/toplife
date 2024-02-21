import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/precollege_study_hour_requirement.dart';

void main() {
  group("Precollege Study Hour Requirement:", () {
    test("regular has the correct toddler, child and teen study requirements",
        () {
      expect(
        PrecollegeStudyHourRequirement.regular.toddler,
        1,
        reason: "toddler",
      );

      expect(
        PrecollegeStudyHourRequirement.regular.child,
        3,
        reason: "child",
      );

      expect(
        PrecollegeStudyHourRequirement.regular.teen,
        5,
      );
    });

    test("extra has the correct toddler, child and teen study requirements",
        () {
      expect(
        PrecollegeStudyHourRequirement.extra.toddler,
        1,
        reason: "toddler",
      );

      expect(
        PrecollegeStudyHourRequirement.extra.child,
        5,
        reason: "child",
      );

      expect(
        PrecollegeStudyHourRequirement.extra.teen,
        8,
      );
    });
  });
}
