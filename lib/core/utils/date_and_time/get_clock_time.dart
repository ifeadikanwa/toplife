import 'package:toplife/core/utils/date_and_time/convert_to_hours_and_minutes.dart';
import 'package:toplife/core/utils/date_and_time/pad_time.dart';

String getClockTime({required int timeInMinutes}) {
  //returns time in 24 hr format
  final time = convertToHoursAndMinutes(timeInMinutes: timeInMinutes);

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
