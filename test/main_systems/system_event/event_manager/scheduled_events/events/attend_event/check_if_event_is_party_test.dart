import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/attendable_events/util/check_if_event_is_party.dart';

void main() {
  group('Check if event is party:', () {
    test('given an event we get the correct value', () {
      for (var eventType in EventType.values) {
        final bool result = checkIfEventIsParty(eventType);
        switch (eventType) {
          //Party
          case EventType.birthdayParty:
          case EventType.wedding:
          case EventType.engagement:
            expect(result, true, reason: "Cause: $eventType");
          //NOT party
          case EventType.funeral:
          case EventType.graduation:
          case EventType.schoolAdmission:
          case EventType.birthday:
          case EventType.death:
          case EventType.askForSchoolTuition:
          case EventType.employment:
            expect(result, false, reason: "Cause: $eventType");
        }
      }
    });
  });
}
