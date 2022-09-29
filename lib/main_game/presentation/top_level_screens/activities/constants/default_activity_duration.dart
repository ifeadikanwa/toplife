import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';

enum DefaultActivityDuration {
  eat(
    durationInMinutes: DurationTimeInMinutes.thirtyMinutes,
  ),
  sleep(
    durationInMinutes: DurationTimeInMinutes.oneHour,
    canTakeLonger: true,
  );

  const DefaultActivityDuration({
    required this.durationInMinutes,
    this.canTakeLonger = false,
  });

  final int durationInMinutes;
  final bool canTakeLonger;
}
