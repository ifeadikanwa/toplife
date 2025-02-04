import 'package:toplife/core/utils/date_and_time/time.dart';

int convertMinutesToTruncatedHours(int minutes) {
  if (minutes == 0) {
    return 0;
  }

  //leave the remainder
  return minutes.abs() ~/ Time.minutesInAnHour;
}
