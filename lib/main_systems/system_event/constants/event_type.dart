import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';

enum EventType {
  birthday(eventDuration: 0),
  birthdayParty(eventDuration: DurationTimeInMinutes.fourHours),
  death(eventDuration: 0),
  funeral(eventDuration: DurationTimeInMinutes.threeHours),
  schoolAdmission(eventDuration: 0),
  engagement(eventDuration: 0),
  wedding(eventDuration: DurationTimeInMinutes.sixHours),
  employment(eventDuration: 0),
  graduation(eventDuration: 0);

  const EventType({required this.eventDuration});
  final int eventDuration;
}
