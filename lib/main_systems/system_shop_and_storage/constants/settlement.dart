// ignore_for_file: constant_identifier_names

import 'package:toplife/core/utils/date_and_time/time_in_minutes.dart';

enum Settlement {
  //*default time is bus time(it's meant to be uncomfortably long), cars reduce the commute time
  
  Village(
    defaultCommuteTimeInMinutes: TimeInMinutes.twoHours,
  ), //2hr?
  Town(
    defaultCommuteTimeInMinutes: TimeInMinutes.oneHourThirtyMinutes,
  ), //1hr30m?,
  City(
    defaultCommuteTimeInMinutes: TimeInMinutes.oneHour,
  ); //1hr?

  const Settlement({required this.defaultCommuteTimeInMinutes});
  final int defaultCommuteTimeInMinutes;
}
