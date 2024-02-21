import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';

String getAttendableEventTime({
  required Event event,
}) {
  final String startTime = (event.startTime != null)
      ? getClockTime(timeInMinutes: event.startTime!)
      : "";

  final String endTime = (event.endTime != null)
      ? getClockTime(timeInMinutes: event.endTime!)
      : "";

  if (startTime.isEmpty || endTime.isEmpty) {
    return "Time: -";
  }

  return "Time: $startTime - $endTime";
}
