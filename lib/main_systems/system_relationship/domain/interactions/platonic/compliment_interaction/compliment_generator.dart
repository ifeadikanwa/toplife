import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';

class ComplimentGenerator {
 static SentencePair getRandomCompliment({
    required Person person,
    required String relationshipLabel,
  }) {
    return SentencePair(
      firstPersonSentence:
          "I complimented my $relationshipLabel, ${person.firstName}",
      secondPersonSentence:
          "You complimented your $relationshipLabel, ${person.firstName}",
    );
  }
}
