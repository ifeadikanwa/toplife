import 'package:toplife/core/utils/date_and_time/time.dart';

Time convertToHoursAndMinutes({required int timeInMinutes}) {
  final int hours = timeInMinutes ~/ Time.minutesInAnHour;

  final int minutes = (timeInMinutes % Time.minutesInAnHour);

  return Time(hours: hours, minutes: minutes);
}
