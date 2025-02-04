import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';

int getPrecollegeAttendancePercentage({
  required int attendanceDays,
  required SchoolType precollegeSchoolType,
}) {
  //get the required attendance days
  final int requiredAttendanceDays = SchoolInfo.getRequiredSchoolDays(
    precollegeSchoolType,
  );

  //calculation
  //make sure we are not dividing by zero
  final double attendancePercentage = (requiredAttendanceDays == 0)
      ? 0.0
      : (attendanceDays / requiredAttendanceDays) * 100;

  return crossCheckStat(
    stat: attendancePercentage.round(),
    statsRange: SchoolInfo.gradingStatsRange,
  );
}
