import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';

int getPrecollegeHomeworkPercentage({
  required int submittedHomework,
  required SchoolType precollegeSchoolType,
}) {
  //get the required attendance days
  final int requiredSubmittedHomework = SchoolInfo.getRequiredSchoolDays(
    precollegeSchoolType,
  );

  //calculation
  //make sure we are not dividing by zero
  final double homeworkPercentage = (requiredSubmittedHomework == 0)
      ? 0.0
      : (submittedHomework / requiredSubmittedHomework) * 100;

  return crossCheckStat(
    stat: homeworkPercentage.round(),
    statsRange: SchoolInfo.gradingStatsRange,
  );
}
