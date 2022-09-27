import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_journal/constants/journal_characters.dart';

void main() {
  group("Journal characters:", () {
    test(
      "full stop is .",
      () {
        expect(JournalCharacters.fullStop, ".");
      },
    );

    test(
      "question mark is ?",
      () {
        expect(JournalCharacters.questionMark, "?");
      },
    );

    test(
      "new line is '\\n'",
      () {
        expect(JournalCharacters.newLine, "\n");
      },
    );

    test(
      "empty string is """,
      () {
        expect(JournalCharacters.emptyString, "");
      },
    );
  });
}
