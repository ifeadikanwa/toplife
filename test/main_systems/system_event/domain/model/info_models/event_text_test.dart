import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_text.dart';

void main() {
  group('Event text:', () {
    test('blank event text is correct', () {
      expect(
        EventText.blankEventText,
        const EventText(
            eventTitle: "-",
            eventDescription: "-",
            journalEntry: "-",
            resultTitle: "-",
            resultDescription: "-"),
      );
    });
  });
}
