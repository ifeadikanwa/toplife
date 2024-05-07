import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/event_category.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/event_type.dart';

void main() {
  group("Event type", () {
    //duration

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
      "graduation event duration is 3 hours",
      () {
        expect(EventType.graduation.eventDuration, 180);
      },
    );

    test(
      "askForSchoolTuition event duration is 0",
      () {
        expect(EventType.askForSchoolTuition.eventDuration, 0);
      },
    );

    //presentation name

    test(
      "birthday event presentation name is ",
      () {
        expect(EventType.birthday.presentationName, "Birthday");
      },
    );

    test(
      "birthday party event presentation name is Birthday Party",
      () {
        expect(EventType.birthdayParty.presentationName, "Birthday Party");
      },
    );

    test(
      "death event presentation name is Death",
      () {
        expect(EventType.death.presentationName, "Death");
      },
    );

    test(
      "funeral event presentation name is School Admission",
      () {
        expect(EventType.funeral.presentationName, "Funeral");
      },
    );

    test(
      "school admission event presentation name is School Admission",
      () {
        expect(EventType.schoolAdmission.presentationName, "School Admission");
      },
    );

    test(
      "engagement event presentation name is Engagement",
      () {
        expect(EventType.engagement.presentationName, "Engagement");
      },
    );

    test(
      "wedding event presentation name is Wedding",
      () {
        expect(EventType.wedding.presentationName, "Wedding");
      },
    );

    test(
      "employment event presentation name is Employment",
      () {
        expect(EventType.employment.presentationName, "Employment");
      },
    );

    test(
      "graduation event presentation name is Graduation",
      () {
        expect(EventType.graduation.presentationName, "Graduation");
      },
    );

    test(
      "askForSchoolTuition event presentation name is Ask For School Tuition",
      () {
        expect(EventType.askForSchoolTuition.presentationName,
            "Ask For School Tuition");
      },
    );

    //event category

    test(
      "birthday event category is unmovableAutonomousEvent",
      () {
        expect(EventType.birthday.eventCategory,
            EventCategory.unmovableAutonomousEvent);
      },
    );

    test(
      "birthday party event category is attendableEvent",
      () {
        expect(EventType.birthdayParty.eventCategory,
            EventCategory.attendableEvent);
      },
    );

    test(
      "death event category is unmovableAutonomousEvent",
      () {
        expect(EventType.death.eventCategory,
            EventCategory.unmovableAutonomousEvent);
      },
    );

    test(
      "funeral event category is attendableEvent",
      () {
        expect(EventType.funeral.eventCategory, EventCategory.attendableEvent);
      },
    );

    test(
      "school admission event category is journalOnlyEvent",
      () {
        expect(EventType.schoolAdmission.eventCategory,
            EventCategory.journalOnlyEvent);
      },
    );

    test(
      "engagement event category is journalOnlyEvent",
      () {
        expect(
            EventType.engagement.eventCategory, EventCategory.journalOnlyEvent);
      },
    );

    test(
      "wedding event category is attendableEvent",
      () {
        expect(EventType.wedding.eventCategory, EventCategory.attendableEvent);
      },
    );

    test(
      "employment event category is journalOnlyEvent",
      () {
        expect(
            EventType.employment.eventCategory, EventCategory.journalOnlyEvent);
      },
    );

    test(
      "graduation event category is attendableEvent",
      () {
        expect(
            EventType.graduation.eventCategory, EventCategory.attendableEvent);
      },
    );

    test(
      "askForSchoolTuition event category is movableAutonomousEvent",
      () {
        expect(EventType.askForSchoolTuition.eventCategory,
            EventCategory.movableAutonomousEvent);
      },
    );
  });
}
