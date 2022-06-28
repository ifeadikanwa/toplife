import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/util/get_random_gender.dart';

void main() {
  test("getRandomGender returns only male or female", () {
    Gender result = getRandomGender();
    assert(result == Gender.Female || result == Gender.Male);
  });
}
