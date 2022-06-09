import 'package:toplife/core/utils/date_and_time/day_and_minutes.dart';

DayAndMinutes addTime({
  required int currentDay,
  required int currentTimeInMinutes,
  required int timeToAddInMinutes,
}) {
  const int maxTimeInMinutes = 1440;

  final int newCurrentTime =
      (currentTimeInMinutes + timeToAddInMinutes) % maxTimeInMinutes;

  final int newCurrentDay = currentDay +
      ((currentTimeInMinutes + timeToAddInMinutes) ~/ maxTimeInMinutes);

  return DayAndMinutes(
    day: newCurrentDay,
    minutes: newCurrentTime,
    isNewDay: currentDay != newCurrentDay,
  );
}
