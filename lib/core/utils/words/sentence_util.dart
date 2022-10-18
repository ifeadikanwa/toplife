import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:toplife/core/utils/words/pronouns.dart';
import 'package:toplife/main_systems/system_journal/constants/journal_characters.dart';

class SentenceUtil {
  static const vowels = [
    "a",
    "e",
    "i",
    "o",
    "u",
  ];

  static final HashMap<String, String> firstPersontoSecondPersonPronounsMap =
      HashMap.of(
    {
      Pronouns.i: Pronouns.you,
      Pronouns.me: Pronouns.you,
      Pronouns.my: Pronouns.your,
      Pronouns.mine: Pronouns.yours,
      Pronouns.our: Pronouns.your,
      Pronouns.ours: Pronouns.yours,
      Pronouns.myself: Pronouns.yourself,
      Pronouns.we: Pronouns.you,
      Pronouns.ourselves: Pronouns.yourselves,
    },
  );

  static const firstPersonVerbAm = "am";
  static const firstPersonVerbWas = "was";
  static const secondPersonVerbAre = "are";
  static const secondPersonVerbWere = "were";

  static String getArticle(String word) {
    if (word.isEmpty) {
      return word;
    }

    if (vowels.contains(Characters(word).first.toLowerCase())) {
      return "An";
    } else {
      return "A";
    }
  }

  static String convertFromFirstPersonToSecondPerson({
    required String firstPersonSentence,
  }) {
    StringBuffer secondPersonSentenceBuffer = StringBuffer();
    final List<String> words = firstPersonSentence.split(" ");

    bool nextWordIsCapitalized = true;
    bool previousWordWasFirstPersonPronoun = false;

    for (var word in words) {
      if (word.trim().isNotEmpty) {
        //prep the word for checking
        late final String preppedWord;
        late final String endSymbol;

        //symbols
        if (word.endsWith(JournalCharacters.fullStop) ||
            word.endsWith(JournalCharacters.questionMark) ||
            word.endsWith(JournalCharacters.exclamationMark) ||
            word.endsWith(JournalCharacters.comma)) {
          //every char except the last
          preppedWord = word.substring(0, word.length - 1);
          //only the last char
          endSymbol = word.substring(word.length - 1);
        }
        //no symbol
        else {
          preppedWord = word;
          endSymbol = JournalCharacters.emptyString;
        }

        //Pronoun found
        if (firstPersontoSecondPersonPronounsMap
            .containsKey(preppedWord.toLowerCase())) {
          //convert
          final String newPronoun =
              firstPersontoSecondPersonPronounsMap[preppedWord.toLowerCase()] ??
                  JournalCharacters.emptyString;

          //capitalize if needed
          if (nextWordIsCapitalized) {
            secondPersonSentenceBuffer
                .write("${toBeginningOfSentenceCase(newPronoun)}$endSymbol ");

            nextWordIsCapitalized = false;
          } else {
            secondPersonSentenceBuffer.write("$newPronoun$endSymbol ");
          }

          //mark for next loop
          previousWordWasFirstPersonPronoun = true;
        }
        //handle am after first person pronoun
        else if (preppedWord.toLowerCase() == firstPersonVerbAm &&
            previousWordWasFirstPersonPronoun) {
          secondPersonSentenceBuffer.write("$secondPersonVerbAre ");
          previousWordWasFirstPersonPronoun = false;
          nextWordIsCapitalized = false;
        }
        //handle was after first person pronoun
        else if (preppedWord.toLowerCase() == firstPersonVerbWas &&
            previousWordWasFirstPersonPronoun) {
          secondPersonSentenceBuffer.write("$secondPersonVerbWere ");
          previousWordWasFirstPersonPronoun = false;
          nextWordIsCapitalized = false;
        }
        //Not pronoun
        else {
          secondPersonSentenceBuffer.write("$preppedWord$endSymbol ");
          //reset to make sure it's handled even when we don't have a pronoun
          nextWordIsCapitalized = false;
          previousWordWasFirstPersonPronoun = false;
        }

        //check if next word is capitalized
        if (endSymbol == JournalCharacters.fullStop ||
            endSymbol == JournalCharacters.exclamationMark ||
            endSymbol == JournalCharacters.questionMark) {
          nextWordIsCapitalized = true;
        }
      }
    }

    return secondPersonSentenceBuffer.toString().trimRight();
  }
}
