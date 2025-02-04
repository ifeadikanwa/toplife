import 'package:toplife/core/utils/date_and_time/day_and_minutes.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';

int getMinutesBetweenTwoTimes({
  required DayAndMinutes startTime,
  required DayAndMinutes endTime,
}) {
  //if it is the same day, subtract to find the time between the two minutes
  if (startTime.day == endTime.day) {
    //handle possible error case: start minutes is larger than end minutes
    if (startTime.minutes > endTime.minutes) {
      return startTime.minutes - endTime.minutes;
    }

    //normal case
    return endTime.minutes - startTime.minutes;
  }
  //we have different days
  else {
    int sumOfMinutes = 0;

    //handle a potential error case where the start time is after the end time
    int firstDay = (endTime.day > startTime.day) ? startTime.day : endTime.day;
    int firstDayMinutes = (endTime.day > startTime.day) ? startTime.minutes : endTime.minutes;

    //handle a potential error case where the start time is after the end time
    int lastDay = (endTime.day > startTime.day) ? endTime.day : startTime.day;
    int lastDayMinutes = (endTime.day > startTime.day) ? endTime.minutes : startTime.minutes;

    //starting from the first day and looping till the last day
    for (var i = firstDay; i <= lastDay; i++) {
      //if it is the first day, calculate the minutes from the current time till the end of that day(1440)
      if (i == firstDay) {
        sumOfMinutes += Time.minutesInADay - firstDayMinutes;
      }
      //if it is the last day, calculate the minutes from beginning of the day(0) to the current time (basically add the minutes straight)
      else if (i == lastDay) {
        sumOfMinutes += lastDayMinutes;
      }
      //if it is not one of the above, it is a whole new day, add the entire day
      else {
        sumOfMinutes += Time.minutesInADay;
      }
    }

    return sumOfMinutes;
  }
}
