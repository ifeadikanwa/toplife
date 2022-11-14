import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';

enum EventType {
  birthday(
    eventDuration: 0,
    presentationName: "Birthday",
  ),
  birthdayParty(
    eventDuration: DurationTimeInMinutes.fourHours,
    presentationName: "Birthday Party",
  ),
  death(
    eventDuration: 0,
    presentationName: "Death",
  ),
  funeral(
    eventDuration: DurationTimeInMinutes.threeHours,
    presentationName: "Funeral",
  ),
  schoolAdmission(
    eventDuration: 0,
    presentationName: "School Admission",
  ),
  engagement(
    eventDuration: 0,
    presentationName: "Engagement",
  ),
  wedding(
    eventDuration: DurationTimeInMinutes.sixHours,
    presentationName: "Wedding",
  ),
  employment(
    eventDuration: 0,
    presentationName: "Employment",
  ),
  graduation(
    eventDuration: 0,
    presentationName: "Graduation",
  );

  const EventType({
    required this.eventDuration,
    required this.presentationName,
  });
  final int eventDuration;
  final String presentationName;
}
