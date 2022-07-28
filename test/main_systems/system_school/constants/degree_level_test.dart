// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/degree_level.dart';

void main() {
  group("Degree Level:", () {
    test("bachelor is a degree type", () {
      assert(DegreeLevel.bachelor is DegreeLevel);
    });

    test("master is a degree type", () {
      assert(DegreeLevel.master is DegreeLevel);
    });

    test("doctorate is a degree type", () {
      assert(DegreeLevel.doctorate is DegreeLevel);
    });

    test("special is a degree type", () {
      assert(DegreeLevel.special is DegreeLevel);
    });
  });
}
