import 'dart:math';

import 'package:intl/intl.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/util/get_gender_enum_from_string.dart';

class DeathDescriptions {
  static String getRandomDeathCause(String gender) {
    final Gender genderEnum = getGenderEnumFromString(gender);

    List<String> deathCauses = [
      "${genderEnum.subjectPronoun} died during a home invasion",
      "${genderEnum.subjectPronoun} died after slipping in the bathroom",
    ];

    return toBeginningOfSentenceCase(
            deathCauses[Random().nextInt(deathCauses.length)]) ??
        deathCauses[Random().nextInt(deathCauses.length)];
  }

  static String getRandomFuneralArrangementReason(String gender) {
    final Gender genderEnum = getGenderEnumFromString(gender);

    //sentence begins with -> The family has decided to have a burial funeral because...
    List<String> funeralArrangementReasons = [
      "it's what ${genderEnum.subjectPronoun} would have wanted",
      "what better way is there to honor ${genderEnum.possessivepronoun} life",
    ];

    return funeralArrangementReasons[
        Random().nextInt(funeralArrangementReasons.length)];
  }

  static String getRandomContributionPositiveComment(String gender) {
    final Gender genderEnum = getGenderEnumFromString(gender);
    //sentence begins with -> The family has decided to have a burial funeral because...
    List<String> contributionPositiveComments = [
      "The entire family is glad the cost of the funeral has been handled",
      "Your relatives commend you for stepping up in this difficult time",
      "Your family is happy they can give ${genderEnum.objectPronoun} a befitting funeral"
    ];

    return contributionPositiveComments[Random().nextInt(
      contributionPositiveComments.length,
    )];
  }

  static String getRandomContributionNegativeComment() {
    //sentence begins with -> Your siblings x...
    List<String> contributionNegativeComments = [
      "is shocked that you'll blatantly refuse",
      "says you should be ashamed of yourself",
      "is wondering if you had any problems before their death",
      "is refusing to speak to you",
      "is angry and doesn't understand why you would do that",
      "thinks if you're broke you should just say that",
    ];

    return contributionNegativeComments[Random().nextInt(
      contributionNegativeComments.length,
    )];
  }

  static String getRandomContributionNoFundsComment(String gender) {
    // final Gender genderEnum = getGenderEnumFromString(gender);

    //sentence begins with ->
    List<String> contributionNoFundsComments = [
      //nice
      "Your family said it's okay, they know you would contribute if you could",
      "Some relatives offered to cover the remaining costs",
      //mean
      "Your family wonders why you offered to contribute when you are penniless",
      "You overhear some family memebers talking about how you need to get your bread up",
    ];

    return contributionNoFundsComments[Random().nextInt(
      contributionNoFundsComments.length,
    )];
  }
}
