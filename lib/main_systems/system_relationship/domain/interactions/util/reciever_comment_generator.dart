import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';

class RecieverCommentGenerator {
  static SentencePair getRandomGoodComment({
    required Person person,
    required String relationshipLabel,
    required String sentItem,
  }) {
    final String goodFirstPersonSentence =
        "I gave my $relationshipLabel, ${person.firstName} $sentItem. ${person.subjectPronoun} said it's a very welcome surprise.";

    return SentencePair(
      firstPersonSentence: goodFirstPersonSentence,
      secondPersonSentence: SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: goodFirstPersonSentence,
      ),
    );
  }

  static SentencePair getRandomBadComment({
    required Person person,
    required String relationshipLabel,
    required String sentItem,
  }) {
    final String badFirstPersonSentence =
        "I gave my $relationshipLabel, ${person.firstName} $sentItem. ${person.subjectPronoun} said who asked for this?.";

    return SentencePair(
      firstPersonSentence: badFirstPersonSentence,
      secondPersonSentence: SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: badFirstPersonSentence,
      ),
    );
  }

  static SentencePair getRandomSpoiledFoodComment({
    required Person person,
    required String relationshipLabel,
    required String sentItem,
  }) {
    final String badFirstPersonSentence =
        "I gave my $relationshipLabel, ${person.firstName} $sentItem. ${person.subjectPronoun} asked if I was trying to poison ${person.objectPronoun}.";

    return SentencePair(
      firstPersonSentence: badFirstPersonSentence,
      secondPersonSentence: SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: badFirstPersonSentence,
      ),
    );
  }
}
