import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/util/get_random_sexuality.dart';

void main() {
  test("getRandomSexuality for female gender returns only straight or lesbian",
      () {
    Sexuality result = getRandomSexuality(gender: Gender.Female);
    assert(result == Sexuality.Straight || result == Sexuality.Lesbian);
  });

  test("getRandomSexuality for male gender returns only straight or gay", () {
    Sexuality result = getRandomSexuality(gender: Gender.Male);
    assert(result == Sexuality.Straight || result == Sexuality.Gay);
  });
}
