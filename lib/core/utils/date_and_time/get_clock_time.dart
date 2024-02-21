import 'package:toplife/core/utils/date_and_time/convert_to_hours_and_minutes.dart';
import 'package:toplife/core/utils/date_and_time/pad_time.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';

String getClockTime({required int timeInMinutes}) {
  //returns time in raw hours and minutes(might be over 24 hrs)
  final Time rawTime = convertToHoursAndMinutes(timeInMinutes: timeInMinutes);

  // we have to account for situations where the hour is over 24 because it was gotten by simply adding duration to a timeInMinutes
  //example 480m + 1440m(24hr) will give us 1920
  //when we divide by 60 to raw hours, we get 32
  //32 is greater than 24 but is still a valid time of day
  //if we do 32 % 24, we get 8 whisch is within the 24 hour clock format
  late final Time time;
  if (rawTime.hours > Time.hoursInADay) {
    time = Time(
      hours: (rawTime.hours % Time.hoursInADay),
      minutes: rawTime.minutes,
    );
  } else {
    time = rawTime;
  }

  //We want to convert 24 hr format to 12 hr format:

  //if it is 0 or 24 show 12:00 AM because that is the correct 12hr format
  if (time.hours == 0 || time.hours == 24) {
    const int twelveHourFormatHours = 12;

    final String formattedHours = padTime(time: twelveHourFormatHours);
    final String formattedMinutes = padTime(time: time.minutes);

    return "$formattedHours:$formattedMinutes AM";
  }
  //if it's less than 12, it's morning.
  else if (time.hours > 0 && time.hours < 12) {
    final String formattedHours = padTime(time: time.hours);
    final String formattedMinutes = padTime(time: time.minutes);

    return "$formattedHours:$formattedMinutes AM";
  }
  //if it is 12 we want to show 12:00 PM
  else if (time.hours == 12) {
    final String formattedHours = padTime(time: time.hours);
    final String formattedMinutes = padTime(time: time.minutes);

    return "$formattedHours:$formattedMinutes PM";
  }
  //if it's greater than 12, it's afternoon/night
  else {
    final int twelveHourFormatHours = time.hours % 12;

    final String formattedHours = padTime(time: twelveHourFormatHours);
    final String formattedMinutes = padTime(time: time.minutes);

    return "$formattedHours:$formattedMinutes PM";
  }
}
