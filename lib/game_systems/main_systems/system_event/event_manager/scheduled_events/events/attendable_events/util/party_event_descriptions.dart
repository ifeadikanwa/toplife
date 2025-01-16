import 'dart:math';

import 'package:intl/intl.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/util/get_gender_enum_from_string.dart';

class PartyEventDescriptions {
  static String getRandomFirstPersonGoodPartyDescription(String gender) {
    final Gender genderEnum = getGenderEnumFromString(gender);

    List<String> goodPartyDescription = [
      "There was a lot to eat and drink, and the music, ohh the music. Best party ever",
      "It was great, everybody really came to party",
      "I am glad I went, it was really fun",
      "Note to self, never miss any party ${genderEnum.subjectPronoun} throws",

      //celeb appearances
      "${genderEnum.subjectPronoun} really got Travis Scott to perform! Woah",
    ];

    return toBeginningOfSentenceCase(goodPartyDescription[
            Random().nextInt(goodPartyDescription.length)]) ??
        goodPartyDescription[Random().nextInt(goodPartyDescription.length)];
  }

  static String getRandomFirstPersonBadPartyDescription(String gender) {
    final Gender genderEnum = getGenderEnumFromString(gender);

    List<String> badPartyDescription = [
      "I am going to be sick, I don't think the food served was safe for human consumption",
      "They should have said it was a sleeping party, I would have dressed in my PJs",
      "Now I know what NOT to do when throwing a party",
      "${genderEnum.subjectPronoun} can't call this a party",
    ];

    return toBeginningOfSentenceCase(badPartyDescription[
            Random().nextInt(badPartyDescription.length)]) ??
        badPartyDescription[Random().nextInt(badPartyDescription.length)];
  }

  static String getRandomFirstPersonNoGiftReaction(String gender) {
    final Gender genderEnum = getGenderEnumFromString(gender);

    List<String> noGiftReaction = [
      //bad
      "I heard ${genderEnum.objectPronoun} tell someone ${genderEnum.subjectPronoun} doesn't understand why anyone would come empty handed to a party",
      "${genderEnum.subjectPronoun} was a bit dissapointed I didn't get ${genderEnum.objectPronoun} anything",
      "I think I was put at the back on a table for people that came without gifts",

      //good
      "${genderEnum.subjectPronoun} didn't mind that I didn't bring a gift, ${genderEnum.subjectPronoun}'s just glad I am here",
    ];

    return toBeginningOfSentenceCase(
            noGiftReaction[Random().nextInt(noGiftReaction.length)]) ??
        noGiftReaction[Random().nextInt(noGiftReaction.length)];
  }

  static String getRandomFirstPersonGoodGiftReaction(String gender) {
    final Gender genderEnum = getGenderEnumFromString(gender);

    List<String> goodGiftReaction = [
      "I saw ${genderEnum.possessivepronoun} face light up when ${genderEnum.subjectPronoun} opened my gift",
      "${genderEnum.subjectPronoun} said my gift was just perfect",
      "${genderEnum.subjectPronoun} gave me a hug and said thanks after opening my gift",
      "${genderEnum.subjectPronoun} said my gift was just what ${genderEnum.subjectPronoun} wanted",
    ];

    return toBeginningOfSentenceCase(
            goodGiftReaction[Random().nextInt(goodGiftReaction.length)]) ??
        goodGiftReaction[Random().nextInt(goodGiftReaction.length)];
  }

  static String getRandomFirstPersonBadGiftReaction(String gender) {
    final Gender genderEnum = getGenderEnumFromString(gender);

    List<String> badGiftReaction = [
      "I am not sure but it looked liked ${genderEnum.possessivepronoun} smile dropped when ${genderEnum.subjectPronoun} opened my gift",
      "${genderEnum.subjectPronoun} laughed at my gift and said next time I should just ask what ${genderEnum.subjectPronoun} wants",
      "${genderEnum.subjectPronoun} said thanks for the gift in an unusually high pitched voice",
      "${genderEnum.subjectPronoun} said thanks for the gift, I really really really really REALLY didn't have to",
    ];

    return toBeginningOfSentenceCase(
            badGiftReaction[Random().nextInt(badGiftReaction.length)]) ??
        badGiftReaction[Random().nextInt(badGiftReaction.length)];
  }

  static String getRandomGeneralFirstPersonPartnerExcuse(String gender) {
    final Gender genderEnum = getGenderEnumFromString(gender);

    List<String> firstPersonPartyPartnerExcuses = [
      //bad
      "${genderEnum.subjectPronoun} said some of us have more important things to do.",
      "${genderEnum.subjectPronoun} said maybe another time.",
      "${genderEnum.subjectPronoun} said ${genderEnum.subjectPronoun} has some urgent work to finish.",
      "${genderEnum.subjectPronoun} said ${genderEnum.subjectPronoun}'s not really in a party mood.",
      "${genderEnum.subjectPronoun} said it's okay to do things on your own sometimes.",
      "${genderEnum.subjectPronoun} said honestly ${genderEnum.subjectPronoun} just doesn't want to go.",

      //nice
      "${genderEnum.subjectPronoun} said I should send ${genderEnum.possessivepronoun} best wishes.",
      "${genderEnum.subjectPronoun} said ${genderEnum.subjectPronoun}'s really sorry to miss it.",
      "${genderEnum.subjectPronoun} said ${genderEnum.subjectPronoun}'ll really to but ${genderEnum.subjectPronoun} can't.",
      "${genderEnum.subjectPronoun} said ${genderEnum.subjectPronoun} really wanted to go with me."
    ];

    return firstPersonPartyPartnerExcuses[
        Random().nextInt(firstPersonPartyPartnerExcuses.length)];
  }
}
