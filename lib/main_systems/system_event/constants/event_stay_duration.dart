import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';

enum EventStayDuration {
  thirtyMinutes(
    fullName: "Thirty minutes",
    durationInMinutes: DurationTimeInMinutes.thirtyMinutes,
  ),
  oneHour(
    fullName: "One hour",
    durationInMinutes: DurationTimeInMinutes.oneHour,
  ),
  tillTheEnd(
    fullName: "Till the end",
    durationInMinutes: null,
  );

  const EventStayDuration({
    required this.fullName,
    required this.durationInMinutes,
  });
  final String fullName;
  final int? durationInMinutes;
}
