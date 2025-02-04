import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_event/event_manager/scheduled_events/util/standard_event_sentences.dart';

void main() {
  group("Standard event sentences:", () {
    test(
      "get player cant attend description returns the right sentence",
      () {
        final String desc =
            StandardEventSentences.getPlayerCantAttendDescription(
                playerCountry: "PlayerCountry",
                eventMainPersonCountry: "EventMainPersonCountry");

        expect(
          desc,
          "This event is happening in EventMainPersonCountry but you are currently in PlayerCountry.",
        );
      },
    );
  });
}
