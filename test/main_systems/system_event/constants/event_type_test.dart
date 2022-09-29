import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';

void main() {
  group("Event type", () {
    test(
      "birthday event duration is 0",
      () {
        expect(EventType.birthday.eventDuration, 0);
      },
    );

    test(
      "birthday party event duration is 4 hours",
      () {
        expect(EventType.birthdayParty.eventDuration, 240);
      },
    );

    test(
      "death event duration is 0",
      () {
        expect(EventType.death.eventDuration, 0);
      },
    );

    test(
      "funeral event duration is 3 hours",
      () {
        expect(EventType.funeral.eventDuration, 180);
      },
    );

    test(
      "school admission event duration is 0",
      () {
        expect(EventType.schoolAdmission.eventDuration, 0);
      },
    );

    test(
      "engagement event duration is 0",
      () {
        expect(EventType.engagement.eventDuration, 0);
      },
    );

    test(
      "wedding event duration is 6 hours",
      () {
        expect(EventType.wedding.eventDuration, 360);
      },
    );

    test(
      "employment event duration is 0",
      () {
        expect(EventType.employment.eventDuration, 0);
      },
    );

    test(
      "graduation event duration is 0",
      () {
        expect(EventType.graduation.eventDuration, 0);
      },
    );
  });
}
