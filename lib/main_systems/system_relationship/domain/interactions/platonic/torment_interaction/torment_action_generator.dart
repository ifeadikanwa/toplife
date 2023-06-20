import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';

class TormentActionGenerator {
  static SentencePair getCyberbullyAction({
    required Person person,
    required String relationshipLabel,
  }) {
    return SentencePair(
      firstPersonSentence:
          "I cyberbullied my $relationshipLabel, ${person.firstName}",
      secondPersonSentence:
          "You cyberbullied your $relationshipLabel, ${person.firstName}",
    );
  }

  static SentencePair getInsultAction({
    required Person person,
    required String relationshipLabel,
  }) {
    return SentencePair(
      firstPersonSentence:
          "I insulted my $relationshipLabel, ${person.firstName}",
      secondPersonSentence:
          "You insulted your $relationshipLabel, ${person.firstName}",
    );
  }

  static SentencePair getSpreadRumorAction({
    required Person person,
    required String relationshipLabel,
  }) {
    return SentencePair(
      firstPersonSentence:
          "I spread a rumor abour my $relationshipLabel, ${person.firstName}",
      secondPersonSentence:
          "You spread a rumor about your $relationshipLabel, ${person.firstName}",
    );
  }

  static SentencePair getPrankAction({
    required Person person,
    required String relationshipLabel,
  }) {
    return SentencePair(
      firstPersonSentence:
          "I pranked my $relationshipLabel, ${person.firstName}",
      secondPersonSentence:
          "You pranked your $relationshipLabel, ${person.firstName}",
    );
  }
}
