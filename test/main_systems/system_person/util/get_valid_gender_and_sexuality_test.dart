import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/gender_and_sexuality_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_valid_gender_and_sexuality.dart';

void main() {
  group("getValidGenderAndSexuality: ", () {
    test("if partner is male and straight return a straight female", () {
      final result = getValidGenderAndSexuality(
        partnerGender: Gender.Male.name,
        partnerSexuality: Sexuality.Straight.name,
      );

      expect(
        result,
        const GenderAndSexualityPair(
          gender: Gender.Female,
          sexuality: Sexuality.Straight,
        ),
      );
    });

    test("if partner is female and straight return a straight male", () {
      final result = getValidGenderAndSexuality(
        partnerGender: Gender.Female.name,
        partnerSexuality: Sexuality.Straight.name,
      );

      expect(
        result,
        const GenderAndSexualityPair(
          gender: Gender.Male,
          sexuality: Sexuality.Straight,
        ),
      );
    });

    test("if partner is male and gay return a gay male", () {
      final result = getValidGenderAndSexuality(
        partnerGender: Gender.Male.name,
        partnerSexuality: Sexuality.Gay.name,
      );

      expect(
        result,
        const GenderAndSexualityPair(
          gender: Gender.Male,
          sexuality: Sexuality.Gay,
        ),
      );
    });

    test("if partner is female and lesbian return a lesbian female", () {
      final result = getValidGenderAndSexuality(
        partnerGender: Gender.Female.name,
        partnerSexuality: Sexuality.Lesbian.name,
      );

      expect(
        result,
        const GenderAndSexualityPair(
          gender: Gender.Female,
          sexuality: Sexuality.Lesbian,
        ),
      );
    });

    test("if partner is male and bisexual return a straight female or gay male", () {
      final result = getValidGenderAndSexuality(
        partnerGender: Gender.Male.name,
        partnerSexuality: Sexuality.Bisexual.name,
      );

      final correctValues = [const GenderAndSexualityPair(
          gender: Gender.Female,
          sexuality: Sexuality.Straight,
        ),
        const GenderAndSexualityPair(
          gender: Gender.Male,
          sexuality: Sexuality.Gay,
        ),];

      assert(
       correctValues.contains(result)
      );
    });
  });

  test("if partner is female and bisexual return a straight male or lesbian female", () {
      final result = getValidGenderAndSexuality(
        partnerGender: Gender.Female.name,
        partnerSexuality: Sexuality.Bisexual.name,
      );

      final correctValues = [const GenderAndSexualityPair(
          gender: Gender.Male,
          sexuality: Sexuality.Straight,
        ),
        const GenderAndSexualityPair(
          gender: Gender.Female,
          sexuality: Sexuality.Lesbian,
        ),];

      assert(
       correctValues.contains(result)
      );
    });
}
