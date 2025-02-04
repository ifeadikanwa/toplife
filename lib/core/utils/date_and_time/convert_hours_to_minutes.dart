import 'package:toplife/core/utils/date_and_time/time.dart';

int convertHoursToMinutes(int hours) {
  return hours.abs() * Time.minutesInAnHour;
}
