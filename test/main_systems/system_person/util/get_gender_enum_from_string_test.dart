import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_gender_enum_from_string.dart';

void main() {
  group("Get gender enum from string:", () {
    test(
      "Male or male gender string returns Male gender enum",
      () {
        expect(
          getGenderEnumFromString("Male"),
          Gender.Male,
          reason: "String: Male",
        );

        expect(
          getGenderEnumFromString("male"),
          Gender.Male,
          reason: "String: male",
        );
      },
    );

    test(
      "Female or female gender string returns Female gender enum",
      () {
        expect(
          getGenderEnumFromString("Female"),
          Gender.Female,
          reason: "String: Female",
        );

        expect(
          getGenderEnumFromString("female"),
          Gender.Female,
          reason: "String: female",
        );
      },
    );

    test(
      "inavlid gender string returns Female gender enum",
      () {
        expect(
          getGenderEnumFromString("wrong"),
          Gender.Female,
        );
      },
    );
  });
}
