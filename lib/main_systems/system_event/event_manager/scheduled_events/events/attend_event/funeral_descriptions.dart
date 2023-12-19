import 'dart:math';

import 'package:intl/intl.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/util/get_gender_enum_from_string.dart';

class FuneralDescriptions {
  static String getRandomFirstPersonFuneralDescription(String gender) {
    final Gender genderEnum = getGenderEnumFromString(gender);

    List<String> funeralDescription = [
      "There was a large turnout at the funeral, ${genderEnum.subjectPronoun} was really loved.",
      "The atmosphere was filled with grief. Why did ${genderEnum.subjectPronoun} have to leave so soon?",
      "It was great to be surrounded by others who also cared about ${genderEnum.objectPronoun}.",
      "${genderEnum.possessivepronoun} death hit me really hard, at least the funeral gave me a little closure.",
      "Yesterday ${genderEnum.subjectPronoun} was here and now ${genderEnum.subjectPronoun} isn't, it's still hard to wrap my head around it.",
      "There was a lot of crying at the funeral, everyone was an emotional mess.",
      "I wonder if ${genderEnum.subjectPronoun} knew how much I cared about ${genderEnum.objectPronoun}, now I can never tell ${genderEnum.objectPronoun}."
    ];

    return toBeginningOfSentenceCase(
            funeralDescription[Random().nextInt(funeralDescription.length)]) ??
        funeralDescription[Random().nextInt(funeralDescription.length)];
  }

  static String getRandomFirstPersonPartnerExcuse(String gender) {
    final Gender genderEnum = getGenderEnumFromString(gender);

    List<String> firstPersonFuneralPartnerExcuses = [
      //bad
      "${genderEnum.subjectPronoun} said I know ${genderEnum.subjectPronoun} doesn't really like sad situations.",
      "${genderEnum.subjectPronoun} said maybe another time.",
      "${genderEnum.subjectPronoun} said ${genderEnum.subjectPronoun} has some urgent work to finish.",
      "${genderEnum.subjectPronoun} thinks it'll be so awkward with everyone sad and crying.",
      "${genderEnum.subjectPronoun} said ${genderEnum.subjectPronoun}'s in a really good mental space and a funeral will mess that up.",
      "${genderEnum.subjectPronoun} said honestly ${genderEnum.subjectPronoun} just doesn't want to go.",
      //nice
      "${genderEnum.subjectPronoun} said I should send ${genderEnum.possessivepronoun} condolences.",
      "${genderEnum.subjectPronoun} said ${genderEnum.subjectPronoun}'s really sorry.",
      "${genderEnum.subjectPronoun} said ${genderEnum.subjectPronoun}'s sad ${genderEnum.subjectPronoun} can't be there for me."
    ];

    return firstPersonFuneralPartnerExcuses[
        Random().nextInt(firstPersonFuneralPartnerExcuses.length)];
  }
}
