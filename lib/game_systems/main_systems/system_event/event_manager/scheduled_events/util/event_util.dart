import 'dart:math';

import 'package:toplife/core/utils/date_and_time/clock_time_in_minutes.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/event_category.dart';
import 'package:toplife/game_systems/main_systems/system_event/constants/event_type.dart';

class EventUtil {
  //9am-11am
  static const List<int> morningEventStartTimes = [
    ClockTimeInMinutes.nineAM,
    ClockTimeInMinutes.tenAM,
    ClockTimeInMinutes.elevenAM,
  ];

  //12pm-4pm
  static const List<int> afternoonEventStartTimes = [
    ClockTimeInMinutes.twelvePM,
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

  static List<String> getEventTypeNamesInCategory(EventCategory eventCategory) {
    return EventType.values
        .where((eventType) => eventType.eventCategory == eventCategory)
        .map(
          (eventTypeInCategory) => eventTypeInCategory.name,
        )
        .toList();
  }
}
