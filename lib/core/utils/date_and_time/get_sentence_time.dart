import 'package:toplife/core/utils/date_and_time/convert_to_hours_and_minutes.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';

String getSentenceTime({required int timeInMinutes, bool addPlus = false}) {
  final Time time = convertToHoursAndMinutes(timeInMinutes: timeInMinutes);

  String sentenceTime = "";

  if (time.hours != 0) {
    sentenceTime +=
        (time.hours == 1) ? "${time.hours} hour" : "${time.hours} hours";
  }

  if (time.minutes != 0) {
    if (sentenceTime.isNotEmpty) {
      sentenceTime += (time.minutes == 1)
          ? ", and ${time.minutes} minute"
          : ", and ${time.minutes} minutes";
    } else {
      sentenceTime += (time.minutes == 1)
          ? "${time.minutes} minute"
          : "${time.minutes} minutes";
    }
  }

  return sentenceTime.isEmpty ? "-" : sentenceTime;
}
