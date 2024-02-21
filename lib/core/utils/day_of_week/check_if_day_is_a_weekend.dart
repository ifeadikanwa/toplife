import 'package:toplife/core/utils/day_of_week/day_of_week.dart';
import 'package:toplife/core/utils/day_of_week/get_day_of_the_week.dart';

bool checkIfDayIsAWeekend({
  required int day,
}) {
  //get day of the week
  final DayOfWeek dayOfWeek = getDayOfTheWeek(day);
  
  //TRUE if day of week is equal to saturday or sunday
  return (dayOfWeek == DayOfWeek.Saturday || dayOfWeek == DayOfWeek.Sunday);
}
