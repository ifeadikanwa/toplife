import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';



enum EventType {
  //*Autonomous Dialog Events
  death(
    eventDuration: 0,
    presentationName: "Death",
    isAutonomousDialogEvent: true,
  ),
  askForSchoolTuition(
    eventDuration: 0,
    presentationName: "Ask For School Tuition",
    isAutonomousDialogEvent: true,
  ),

  //*Attendable Events
  birthdayParty(
    eventDuration: DurationTimeInMinutes.fourHours,
    presentationName: "Birthday Party",
    isAutonomousDialogEvent: false,
  ),

  funeral(
    eventDuration: DurationTimeInMinutes.threeHours,
    presentationName: "Funeral",
    isAutonomousDialogEvent: false,
  ),
  wedding(
    eventDuration: DurationTimeInMinutes.sixHours,
    presentationName: "Wedding",
    isAutonomousDialogEvent: false,
  ),
  graduation(
    eventDuration: DurationTimeInMinutes.threeHours,
    presentationName: "Graduation",
    isAutonomousDialogEvent: false,
  ),

  //*Journal Only Events
  birthday(
    eventDuration: 0,
    presentationName: "Birthday",
    isAutonomousDialogEvent: false,
  ),

  engagement(
    eventDuration: 0,
    presentationName: "Engagement",
    isAutonomousDialogEvent: false,
  ),

  employment(
    eventDuration: 0,
    presentationName: "Employment",
    isAutonomousDialogEvent: false,
  ),

  schoolAdmission(
    eventDuration: 0,
    presentationName: "School Admission",
    isAutonomousDialogEvent: false,
  );

  const EventType({
    required this.eventDuration,
    required this.presentationName,
    required this.isAutonomousDialogEvent,
  });

  final int eventDuration;
  final String presentationName;
  final bool isAutonomousDialogEvent;

  //What is an autonomous dialog event?
  //Autonomous dialog events are events that interrupt the players gameplay on their own to tell the player something and/or ask for input.
  //Attendable events are not autonomous dialog events since the player has to trigger it themselves by choosing to attend.
  //journal events are not autonomous dialog events since they dont show a popup/dialog but run in the background.
}

const List<EventType> unmovableAutonomousEvents = [
  EventType.death,
];