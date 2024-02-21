import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/utils/date_and_time/get_sentence_time.dart';

void main() {
  group("getSentenceTime:", () {
    test(
      "when given 90 minutes we get 1 hour and 30 minutes",
      () => expect(
        getSentenceTime(timeInMinutes: 90),
        "1 hour and 30 minutes",
      ),
    );

    test(
      "when given 0 minutes we get -",
      () => expect(
        getSentenceTime(timeInMinutes: 0),
        "-",
      ),
    );

    test(
      "when given 181 minutes we get 3 hours and 1 minutes",
      () => expect(
        getSentenceTime(timeInMinutes: 181),
        "3 hours and 1 minute",
      ),
    );

    test(
      "when given 600 minutes we get 10 hours",
      () => expect(
        getSentenceTime(timeInMinutes: 600),
        "10 hours",
      ),
    );test(
      "when given 14 minutes we get 14 minutes",
      () => expect(
        getSentenceTime(timeInMinutes: 14),
        "14 minutes",
      ),
    );
  });
}
