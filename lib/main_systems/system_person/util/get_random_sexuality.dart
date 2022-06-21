import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';

Sexuality getRandomSexuality({required Gender gender}) {
    final correctQueerSexuality =
        (gender == Gender.Female) ? Sexuality.Lesbian : Sexuality.Gay;

    final isStraight =
        Chance.getTrueOrFalseBasedOnPercentageChance(trueChancePercentage: 70);

    return isStraight ? Sexuality.Straight : correctQueerSexuality;
  }