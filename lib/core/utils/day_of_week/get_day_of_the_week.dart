import 'package:toplife/core/utils/day_of_week/day_of_week.dart';

DayOfWeek getDayOfTheWeek(int day) {
  //get the index for the day of the week
  final int dayOfWeekIndex = day.abs() % 7;

  //return day of week at that index
  return DayOfWeek.values[dayOfWeekIndex];
}
