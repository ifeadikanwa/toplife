import 'package:toplife/core/utils/date_and_time/time_in_minutes.dart';

enum Settlement {
  //*default time is bus time(it's meant to be uncomfortably long), cars reduce the commute time
  
  village(
    defaultCommuteTimeInMinutes: TimeInMinutes.twoHours,
  ), //2hr?
  town(
    defaultCommuteTimeInMinutes: TimeInMinutes.oneHourThirtyMinutes,
  ), //1hr30m?,
  city(
    defaultCommuteTimeInMinutes: TimeInMinutes.oneHour,
  ); //1hr?

  const Settlement({required this.defaultCommuteTimeInMinutes});
  final int defaultCommuteTimeInMinutes;
}
