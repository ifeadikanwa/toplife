import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/event_category.dart';

//What is an autonomous dialog event?
//Autonomous dialog events are events that interrupt the players gameplay on their own to tell the player something and/or ask for input.
//Attendable events are not autonomous dialog events since the player has to trigger it themselves by choosing to attend.
//journal events are not autonomous dialog events since they dont show a popup/dialog but run in the background.
enum EventType {
  //*Autonomous Dialog Events
  //-unmovable: person must die on the chosen day
  death(
    eventDuration: 0,
    presentationName: "Death",
    eventCategory: EventCategory.unmovableAutonomousEvent,
  ),
  //contains the age up action usecase, runs actions for entering the person into the new lifestage
  //we might have dialogs to communicate changes with the player
  //-unmovable: the birthday can only happen on the set day
  birthday(
    eventDuration: 0,
    presentationName: "Birthday",
    eventCategory: EventCategory.unmovableAutonomousEvent,
  ),

  //-Movable
  askForSchoolTuition(
    eventDuration: 0,
    presentationName: "Ask For School Tuition",
    eventCategory: EventCategory.movableAutonomousEvent,
  ),

  //*Attendable Events
  birthdayParty(
    eventDuration: DurationTimeInMinutes.fourHours,
    presentationName: "Birthday Party",
    eventCategory: EventCategory.attendableEvent,
  ),
  funeral(
    eventDuration: DurationTimeInMinutes.threeHours,
    presentationName: "Funeral",
    eventCategory: EventCategory.attendableEvent,
  ),
  wedding(
    eventDuration: DurationTimeInMinutes.sixHours,
    presentationName: "Wedding",
    eventCategory: EventCategory.attendableEvent,
  ),
  graduation(
    eventDuration: DurationTimeInMinutes.threeHours,
    presentationName: "Graduation",
    eventCategory: EventCategory.attendableEvent,
  ),

  //*Journal Only Events

  engagement(
    eventDuration: 0,
    presentationName: "Engagement",
    eventCategory: EventCategory.journalOnlyEvent,
  ),
  employment(
    eventDuration: 0,
    presentationName: "Employment",
    eventCategory: EventCategory.journalOnlyEvent,
  ),
  schoolAdmission(
    eventDuration: 0,
    presentationName: "School Admission",
    eventCategory: EventCategory.journalOnlyEvent,
  );

  const EventType({
    required this.eventDuration,
    required this.presentationName,
    required this.eventCategory,
  });

  final int eventDuration;
  final String presentationName;
  final EventCategory eventCategory;
}
