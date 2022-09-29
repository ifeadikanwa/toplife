import 'dart:math';

import 'package:toplife/core/utils/date_and_time/clock_time_in_minutes.dart';

class EventUtil {
  //9am-11am
  static const List<int> morningEventStartTimes = [
    ClockTimeInMinutes.nineAM,
    ClockTimeInMinutes.tenAM,
    ClockTimeInMinutes.elevenAM,
  ];

  //1pm-4pm
  static const List<int> afternoonEventStartTimes = [
    ClockTimeInMinutes.onePM,
    ClockTimeInMinutes.twoPM,
    ClockTimeInMinutes.threePM,
    ClockTimeInMinutes.fourPM,
  ];

  //7pm-10pm
  static const List<int> nightEventStartTimes = [
    ClockTimeInMinutes.sevenPM,
    ClockTimeInMinutes.eightPM,
    ClockTimeInMinutes.ninePM,
    ClockTimeInMinutes.tenPM,
  ];

  static int getRandomEventStartTime({
    required bool canBeMorning,
    required bool canBeAfternoon,
    required bool canBeNight,
  }) {
    //put the possibilities into an array and pick one at random

    List<int> possibleStartTimes = [];

    if (canBeMorning) {
      possibleStartTimes.addAll(morningEventStartTimes);
    }
    if (canBeAfternoon) {
      possibleStartTimes.addAll(afternoonEventStartTimes);
    }
    if (canBeNight) {
      possibleStartTimes.addAll(nightEventStartTimes);
    }

    if (possibleStartTimes.isEmpty) {
      //choose a random afternoon time
      return afternoonEventStartTimes[
          Random().nextInt(afternoonEventStartTimes.length)];
    }

    //return a random possible time
    return possibleStartTimes[Random().nextInt(possibleStartTimes.length)];
  }
}
