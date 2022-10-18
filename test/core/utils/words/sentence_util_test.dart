import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';

void main() {
  group("Sentence Util:", () {
    test(
      "vowels list contains all the vowels",
      () {
        expect(SentenceUtil.vowels, [
          "a",
          "e",
          "i",
          "o",
          "u",
        ]);
      },
    );

    test(
      "firstPersonVerbAm is am",
      () {
        expect(SentenceUtil.firstPersonVerbAm, "am");
      },
    );

    test(
      "firstPersonVerbWas is was",
      () {
        expect(SentenceUtil.firstPersonVerbWas, "was");
      },
    );

    test(
      "secondPersonVerbAre is are",
      () {
        expect(SentenceUtil.secondPersonVerbAre, "are");
      },
    );

    test(
      "secondPersonVerbWere is were",
      () {
        expect(SentenceUtil.secondPersonVerbWere, "were");
      },
    );

    group("get article:", () {
      test(
        "get article returns \"An\" if word starts with a vowel",
        () {
          expect(SentenceUtil.getArticle("Apple"), "An");
        },
      );

      test(
        "get article returns \"A\" if word does NOT start with a vowel",
        () {
          expect(SentenceUtil.getArticle("Phone"), "A");
        },
      );
    });

    group("convert From First Person To Second Person:", () {
      test(
        "given a sentence without first person pronouns, the sentence is returned as is",
        () {
          const originalSentence =
              "There are no personal pronouns in here, did you notice?";

          expect(
            SentenceUtil.convertFromFirstPersonToSecondPerson(
                firstPersonSentence: originalSentence),
            originalSentence,
          );
        },
      );

      test(
        "given sentence with all the first person prononuns returns new sentence with only equivalent second person pronouns",
        () {
          const originalSentence =
              "My sentence might not make sense. Mine won't by myself, I can't lie. Our to me to ours! we from ourselves.";

          expect(
            SentenceUtil.convertFromFirstPersonToSecondPerson(
                firstPersonSentence: originalSentence),
            "Your sentence might not make sense. Yours won't by yourself, you can't lie. Your to you to yours! You from yourselves.",
          );
        },
      );

      test(
        "given a sentence with unnecessary spaces return correct sentence with correct spaces",
        () {
          const originalSentence =
              "I put  a bunch of    unnecessary spaces    for me";

          expect(
              SentenceUtil.convertFromFirstPersonToSecondPerson(
                  firstPersonSentence: originalSentence),
              "You put a bunch of unnecessary spaces for you");
        },
      );

      test(
        "given a sentence with am preceded by a first person pronoun it should be replaced with are",
        () {
          const originalSentence = "I am happy";

          expect(
            SentenceUtil.convertFromFirstPersonToSecondPerson(
                firstPersonSentence: originalSentence),
            "You are happy",
          );
        },
      );

      test(
        "given a sentence with am NOT preceded by a first person pronoun it should be replaced with are",
        () {
          const originalSentence = "I love using am in my sentences";

          expect(
            SentenceUtil.convertFromFirstPersonToSecondPerson(
                firstPersonSentence: originalSentence),
            "You love using am in your sentences",
          );
        },
      );

       test(
        "given a sentence with was preceded by a first person pronoun it should be replaced with are",
        () {
          const originalSentence = "I was happy";

          expect(
            SentenceUtil.convertFromFirstPersonToSecondPerson(
                firstPersonSentence: originalSentence),
            "You were happy",
          );
        },
      );

      test(
        "given a sentence with was NOT preceded by a first person pronoun it should be replaced with are",
        () {
          const originalSentence = "I love using was in my sentences";

          expect(
            SentenceUtil.convertFromFirstPersonToSecondPerson(
                firstPersonSentence: originalSentence),
            "You love using was in your sentences",
          );
        },
      );
    });
  });
}
