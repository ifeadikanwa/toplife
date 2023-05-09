import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_event/constants/event_type.dart';

void main() {
  group("Event type", () {
    test(
        "unmovable autonomous events contains correct event types",
        () => expect(unmovableAutonomousEvents, [
              EventType.death,
            ]));
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

    //Autonomous dialog event

    test("death is an autonomous dialog event",
        () => expect(EventType.death.isAutonomousDialogEvent, true));

    test(
        "askForSchoolTuition is an autonomous dialog event",
        () => expect(
            EventType.askForSchoolTuition.isAutonomousDialogEvent, true));
    test("birthdayParty is an autonomous dialog event",
        () => expect(EventType.birthdayParty.isAutonomousDialogEvent, false));

    test("funeral is an autonomous dialog event",
        () => expect(EventType.funeral.isAutonomousDialogEvent, false));

    test("wedding is an autonomous dialog event",
        () => expect(EventType.wedding.isAutonomousDialogEvent, false));

    test("graduation is an autonomous dialog event",
        () => expect(EventType.graduation.isAutonomousDialogEvent, false));

    test("birthday is an autonomous dialog event",
        () => expect(EventType.birthday.isAutonomousDialogEvent, false));

    test("engagement is an autonomous dialog event",
        () => expect(EventType.engagement.isAutonomousDialogEvent, false));

    test("employment is an autonomous dialog event",
        () => expect(EventType.employment.isAutonomousDialogEvent, false));

    test("schoolAdmission is an autonomous dialog event",
        () => expect(EventType.schoolAdmission.isAutonomousDialogEvent, false));
  });
}
