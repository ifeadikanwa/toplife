import 'package:toplife/core/utils/date_and_time/time_in_minutes.dart';

enum DefaultActivityDuration {
  eat(
    durationInMinutes: TimeInMinutes.thirtyMinutes,
  ),
  sleep(
    durationInMinutes: TimeInMinutes.oneHour,
    canTakeLonger: true,
  );

  const DefaultActivityDuration({
    required this.durationInMinutes,
    this.canTakeLonger = false,
  });

  final int durationInMinutes;
  final bool canTakeLonger;
}
