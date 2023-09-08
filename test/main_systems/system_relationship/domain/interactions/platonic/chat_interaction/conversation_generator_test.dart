import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/words/comment_checker.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/chat_interaction/conversation_generator.dart';

void main() {
  group("Conversation Generator:", () {
    group("Regular Chat Descriptions:", () {
      test("always starts with 'had'", () {
        for (var regularChatDescription
            in ConversationGenerator.regularChatDescriptions) {
          expect(
            regularChatDescription,
            startsWith("had"),
          );
        }
      });
      test("all letters are lowercase", () {
        for (var regularChatDescription
            in ConversationGenerator.regularChatDescriptions) {
          expect(
            regularChatDescription,
            equals(regularChatDescription.toLowerCase()),
          );
        }
      });
      test("contains no non-personal pronouns", () {
        final result = CommentChecker.checkCommentsForNonPersonalPronouns(
            ConversationGenerator.regularChatDescriptions.toList());

        result.forEach((key, value) {
          expect(key, false, reason: value);
        });
      });
    });

    group("Debate Chat Descriptions:", () {
      test("always starts with 'had'", () {
        for (var debateDescription
            in ConversationGenerator.debateDescriptions) {
          expect(
            debateDescription,
            startsWith("had"),
          );
        }
      });
      test("all letters are lowercase", () {
        for (var debateDescription
            in ConversationGenerator.debateDescriptions) {
          expect(
            debateDescription,
            equals(debateDescription.toLowerCase()),
          );
        }
      });
      test("contains no non-personal pronouns", () {
        final result = CommentChecker.checkCommentsForNonPersonalPronouns(
            ConversationGenerator.debateDescriptions.toList());

        result.forEach((key, value) {
          expect(key, false, reason: value);
        });
      });
    });

    group("Positive and Negative Description Adjectives:", () {
      test("all adjectives are one word", () {
        for (var adjective
            in ConversationGenerator.positiveAndNegativeDescriptionAdjectives) {
          expect(
            adjective.split(" "),
            hasLength(1),
            reason: "Cause: $adjective",
          );
        }
      });

      test("all letters are lowercase", () {
        for (var adjective
            in ConversationGenerator.positiveAndNegativeDescriptionAdjectives) {
          expect(
            adjective,
            equals(adjective.toLowerCase()),
          );
        }
      });
    });

    group("Yes and No Words:", () {
      test("all letters are lowercase", () {
        for (var word in ConversationGenerator.yesAndNoWords) {
          expect(
            word,
            equals(word.toLowerCase()),
          );
        }
      });
      test("contains no non-personal pronouns", () {
        final result = CommentChecker.checkCommentsForNonPersonalPronouns(
            ConversationGenerator.yesAndNoWords.toList());

        result.forEach((key, value) {
          expect(key, false, reason: value);
        });
      });
    });

    group("Uninterested Responses:", () {
      test("ende with a punctuation -> ! or . or ?", () {
        for (var response in ConversationGenerator.uninterestedResponses) {
          expect(
              (response.endsWith("!") ||
                  response.endsWith(".") ||
                  response.endsWith("?")),
              true,
              reason: "Cause: $response");
        }
      });

      test("all responses start with uppercase letter", () {
        for (var response in ConversationGenerator.uninterestedResponses) {
          expect(response.characters.first,
              response.characters.first.toUpperCase(),
              reason: "Cause: $response");
        }
      });
    });

    group("or:", () {
      test("or variable contains string ' or '",
          () => expect(ConversationGenerator.or, " or "));
    });

    group("Debate Statement Topics:", () {
      test("always starts with 'whether'", () {
        for (var topic in ConversationGenerator.debateStatementTopics) {
          expect(
            topic,
            startsWith("whether"),
          );
        }
      });
      test("all letters are lowercase", () {
        for (var topic in ConversationGenerator.debateStatementTopics) {
          expect(
            topic,
            equals(topic.toLowerCase()),
          );
        }
      });
    });

    group("Versus Divider Word:", () {
      test("versusDividerWord variable contains string ' vs. '",
          () => expect(ConversationGenerator.versusDividerWord, ' vs. '));
    });

    group("Versus Topics:", () {
      test("all topics contain ' vs. '", () {
        for (var topic in ConversationGenerator.versusTopics) {
          expect(topic, contains(" vs. "));
        }
      });

      test("if we split topic with versus divider word we get two strings", () {
        for (var topic in ConversationGenerator.versusTopics) {
          expect(topic.split(ConversationGenerator.versusDividerWord),
              hasLength(2),
              reason: "Cause: $topic");
        }
      });

      test("all letters are lowercase", () {
        for (var topic in ConversationGenerator.versusTopics) {
          expect(topic, topic.toLowerCase());
        }
      });
    });

    group("Regular Chat Topics:", () {
      test("contains no second person pronoun", () {
        for (var topic in ConversationGenerator.regularChatTopics) {
          expect(
            topic.contains(" you "),
            false,
            reason: "Cause: 'you' in -> $topic",
          );

          expect(
            topic.contains(" your "),
            false,
            reason: "Cause: 'your' in -> $topic",
          );

          expect(
            topic.contains(" yours "),
            false,
            reason: "Cause: 'yours' in -> $topic",
          );
        }
      });

      test("movie names are surrounded by quotes", () {
        for (var topic in ConversationGenerator.regularChatTopics) {
          if (topic.startsWith("the movie ")) {
            expect(topic, startsWith("the movie '"));
            expect(topic, endsWith("'"));
          }
        }
      });
    });

    group("Moments Regular Chat Topics:", () {
      test("contains no second person pronoun", () {
        for (var topic in ConversationGenerator.momentsRegularChatTopics(
            subjectPronoun: "she", possessivePronoun: "her")) {
          expect(
            topic.contains(" you "),
            false,
            reason: "Cause: 'you' in -> $topic",
          );

          expect(
            topic.contains(" your "),
            false,
            reason: "Cause: 'your' in -> $topic",
          );

          expect(
            topic.contains(" yours "),
            false,
            reason: "Cause: 'yours' in -> $topic",
          );
        }
      });

      test("all letters are lowercase", () {
        for (var topic in ConversationGenerator.momentsRegularChatTopics(
            subjectPronoun: "he", possessivePronoun: "his")) {
          expect(topic, topic.toLowerCase());
        }
      });

      test("always starts with 'when'", () {
        for (var topic in ConversationGenerator.momentsRegularChatTopics(
            subjectPronoun: "he", possessivePronoun: "his")) {
          expect(
            topic,
            startsWith("when"),
          );
        }
      });

      test("when given pronouns [she, her] there must be no [he, his] pronouns",
          () {
        for (var topic in ConversationGenerator.momentsRegularChatTopics(
            subjectPronoun: "she", possessivePronoun: "her")) {
          expect(
            topic.contains(" he "),
            false,
            reason: "Cause: 'he' in -> $topic",
          );

          expect(
            topic.contains(" his "),
            false,
            reason: "Cause: 'his' in -> $topic",
          );
        }
      });

      test("when given pronouns [he, his] there must be no [she, her] pronouns",
          () {
        for (var topic in ConversationGenerator.momentsRegularChatTopics(
            subjectPronoun: "he", possessivePronoun: "his")) {
          expect(
            topic.contains(" she "),
            false,
            reason: "Cause: 'she' in -> $topic",
          );

          expect(
            topic.contains(" her "),
            false,
            reason: "Cause: 'her' in -> $topic",
          );
        }
      });
    });

    group("Get First Person Convo Introduction String:", () {
      test(
          "return the correct string",
          () => expect(
                ConversationGenerator.getFirstPersonConvoIntroductionString(
                    firstName: "Susan",
                    chosenDescription: "had a blast chatting",
                    chosenTopic: "reading",
                    relationshipLabel: "friend"),
                "I had a blast chatting with my friend, Susan about reading.",
              ));
    });

    final testPerson = Person(
      id: 0,
      gameId: 1,
      firstName: "Ryan",
      lastName: "Howard",
      dayOfBirth: 89,
      gender: Gender.Male.name,
      subjectPronoun: Gender.Male.subjectPronoun,
      objectPronoun: Gender.Male.objectPronoun,
      possessivePronoun: Gender.Male.possessivepronoun,
      sexuality: Sexuality.Straight.name,
      birthState: "Michigan",
      birthCountry: "United States",
      currentState: "Michigan",
      currentCountry: "United States",
      money: 864000,
      emotionalState: "normal",
      zodiacSign: ZodiacSign.Libra.name,
      transportMode: "bus",
      drivingMode: "drivingMode",
      hasDriversLicense: false,
      hasFertilityIssues: false,
      onBirthControl: false,
      isSterile: false,
      sickly: false,
      dead: false,
    );

    group("Get Random First Person Regular Chat:", () {
      test(
          "contains all the joining words from getFirstPersonConvoIntroductionString function",
          () {
        final result = ConversationGenerator.getRandomFirstPersonRegularChat(
          person: testPerson,
          relationshipLabel: "friend",
        );

        expect(
          result.split(" "),
          containsAll(
            ["I", "with", "my", "about"],
          ),
        );
      });
    });

    group("Get Random First Person Debate:", () {
      final result = ConversationGenerator.getRandomFirstPersonDebate(
        person: testPerson,
        relationshipLabel: "friend",
      );
      test(
          "contains all the joining words from getFirstPersonConvoIntroductionString function",
          () {
        expect(
          result.split(" "),
          containsAll(
            ["I", "with", "my", "about"],
          ),
        );
      });

      test("contains whether or vs.", () {
        final resultWordsList = result.split(" ");
        expect(
          resultWordsList.contains("whether") ||
              resultWordsList.contains("vs."),
          true,
        );
      });
    });

    group("Get Random First Person Debate Statement:", () {
      final result = ConversationGenerator.getRandomFirstPersonDebateStatement(
        person: testPerson,
        relationshipLabel: "friend",
      );

      test(
          "if sentence does not contain 'or' it must have a conclusion sentence in the correct form",
          () {
        if (!result.contains(" or ")) {
          final twoSentences = result.split("\n");

          expect(
            twoSentences,
            hasLength(2),
            reason: "Cause: result has no new line",
          );

          expect(
            twoSentences[1].characters.first,
            twoSentences[1].characters.first.toUpperCase(),
            reason:
                "Cause: conclusion sentence does not begin with uppercase letter",
          );

          expect(
            twoSentences[1].contains(" said "),
            true,
            reason: "Cause: conclusion sentence does not have -> said",
          );
        }
      });

      test(
          "contains all the joining words from getFirstPersonConvoIntroductionString function",
          () {
        expect(
          result.split(" "),
          containsAll(
            ["I", "with", "my", "about"],
          ),
        );
      });
    });

    group("Get Random First Person Versus Debate:", () {
      final result = ConversationGenerator.getRandomFirstPersonVersusDebate(
        person: testPerson,
        relationshipLabel: "friend",
      );

      test("it must have a conclusion sentence in the correct form", () {
        final twoSentences = result.split("\n");

        expect(
          twoSentences,
          hasLength(2),
          reason: "Cause: result has no new line",
        );

        expect(
          twoSentences[1].characters.first,
          twoSentences[1].characters.first.toUpperCase(),
          reason:
              "Cause: conclusion sentence does not begin with uppercase letter",
        );

        expect(
          twoSentences[1].contains(" said ") &&
              twoSentences[1].contains(" is "),
          true,
          reason: "Cause: conclusion sentence does not have -> 'said' and 'is'",
        );
      });

      test(
          "contains all the joining words from getFirstPersonConvoIntroductionString function",
          () {
        expect(
          result.split(" "),
          containsAll(
            ["I", "with", "my", "about"],
          ),
        );
      });
    });

    group("Get Random First Person Uninterested Response:", () {
      final result = ConversationGenerator.getRandomPersonUninterestedResponse(
        person: testPerson,
        relationshipLabel: "friend",
      );

      test('first person response starts correctly', () {
        expect(
          result.firstPersonSentence,
          startsWith("I tried to talk to my "),
        );
      });

      test('second person response starts correctly', () {
        expect(
          result.secondPersonSentence,
          startsWith("You tried to talk to your "),
        );
      });

      test("first person response contains 'and' and 'said'", () {
        expect(
          result.firstPersonSentence.contains(" and ") &&
              result.firstPersonSentence.contains(" said "),
          true,
        );
      });

      test("second person response contains 'and' and 'said'", () {
        expect(
          result.secondPersonSentence.contains(" and ") &&
              result.firstPersonSentence.contains(" said "),
          true,
        );
      });
    });

    group("Get Random First Person Conversation:", () {
      test(
          "contains all the joining words from getFirstPersonConvoIntroductionString function",
          () {
        final result = ConversationGenerator.getRandomFirstPersonConversation(
          person: testPerson,
          relationshipLabel: "friend",
        );
        expect(
          result.split(" "),
          containsAll(
            ["I", "with", "my", "about"],
          ),
        );
      });
    });
  });
}
