import 'dart:math';

import 'package:toplife/core/utils/date_and_time/time.dart';

int getRandomClassStartTime() {
  //class can start at any time between 8am and 12pm
  //pick a random number between 8 - 12
  //convert that number to minutes

  int classStartTimeNumber = Random().nextInt(5) + 8;

  int classStartTimeInMinutes = classStartTimeNumber * Time.minutesInAnHour;

  return classStartTimeInMinutes;
}
