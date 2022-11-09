// ignore_for_file: constant_identifier_names

import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';

enum Settlement {
  //*default time is bus time(it's meant to be uncomfortably long), cars reduce the commute time

  Village(
    defaultCommuteTimeInMinutes: DurationTimeInMinutes.twoHours,
    defaultCommuteFuelConsumption: 20,
  ), //2hr?
  Town(
    defaultCommuteTimeInMinutes: DurationTimeInMinutes.oneHourThirtyMinutes,
    defaultCommuteFuelConsumption: 15,
  ), //1hr30m?,
  City(
    defaultCommuteTimeInMinutes: DurationTimeInMinutes.oneHour,
    defaultCommuteFuelConsumption: 10,
  ); //1hr?

  const Settlement({required this.defaultCommuteTimeInMinutes, required this.defaultCommuteFuelConsumption,});
  final int defaultCommuteTimeInMinutes;
  final int defaultCommuteFuelConsumption;
}
