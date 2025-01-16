import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/gender_and_sexuality_pair.dart';

GenderAndSexualityPair getValidGenderAndSexuality({
  required String partnerGender,
  required String partnerSexuality,
}) {
  if (partnerSexuality == Sexuality.Bisexual.name) {
    final willBeStraight = Chance.getTrueOrFalse();
    if (partnerGender == Gender.Male.name) {
      if (willBeStraight) {
        return const GenderAndSexualityPair(
          gender: Gender.Female,
          sexuality: Sexuality.Straight,
        );
      } else {
        return const GenderAndSexualityPair(
          gender: Gender.Male,
          sexuality: Sexuality.Gay,
        );
      }
    } else {
      if (willBeStraight) {
        return const GenderAndSexualityPair(
          gender: Gender.Male,
          sexuality: Sexuality.Straight,
        );
      } else {
        return const GenderAndSexualityPair(
          gender: Gender.Female,
          sexuality: Sexuality.Lesbian,
        );
      }
    }
  } 
  else if (partnerSexuality == Sexuality.Gay.name) {
    return const GenderAndSexualityPair(
      gender: Gender.Male,
      sexuality: Sexuality.Gay,
    );
  } 
  else if (partnerSexuality == Sexuality.Lesbian.name) {
    return const GenderAndSexualityPair(
      gender: Gender.Female,
      sexuality: Sexuality.Lesbian,
    );
  } 
  else {
    if (partnerGender == Gender.Male.name) {
      return const GenderAndSexualityPair(
        gender: Gender.Female,
        sexuality: Sexuality.Straight,
      );
    } else {
      return const GenderAndSexualityPair(
        gender: Gender.Male,
        sexuality: Sexuality.Straight,
      );
    }
  }
}
