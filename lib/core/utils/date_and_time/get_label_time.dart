
import 'package:toplife/core/utils/date_and_time/convert_to_hours_and_minutes.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';

String getLabelTime({required int timeInMinutes}) {
  final Time time = convertToHoursAndMinutes(timeInMinutes: timeInMinutes);

  String labelTime = "";

  if (time.hours != 0) {
    labelTime += "${time.hours}h";
  }

  if (time.minutes != 0) {
    if (labelTime.isNotEmpty) {
      labelTime += " ${time.minutes}m";
    } else {
      labelTime += "${time.minutes}m";
    }
  }

  return labelTime.isEmpty ? "-" : labelTime;
}
