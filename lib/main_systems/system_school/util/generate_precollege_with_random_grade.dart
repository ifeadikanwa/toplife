import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/main_systems/system_school/constants/school_info.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';

const int lowGradeGroupMax = 50;
const int midGradeGroupMax = 70;
const int highGradeGroupMax = 100;

Precollege generatePrecollegeWithRandomGrade({
  required int studentID,
  required SchoolType precollegeSchoolType,
  required int schoolID,
  required bool active,
  required int intelligenceStats,
}) {
  //get the required school days
  final int requiredSchoolDays = SchoolInfo.getRequiredSchoolDays(
    precollegeSchoolType,
  );

  //find the range multipliers using the intelligence stats:
  //If we have 0 - 1, I want people with intelligence 0 - 50 to have all their grade determinant be a number int the range 0 - 0.5,
  // I want people in the range 50- 70 to have all their grade determinants be a number in the range 0.5 - 0.7
  // I want people in the range 70 - 100 to have all their grade determinants be a random number in the range  0.7 - 1.0
  //Example: a child with 60% intelligence, the range for picking a random attendance score
  // (assuming min att is 0 and max is 14) will be 0.5*14 -> 0.7*14

  late final double rangeMinMultiplier;
  late final double rangeMaxMultiplier;

  if (intelligenceStats < lowGradeGroupMax) {
    rangeMinMultiplier = 0;
    rangeMaxMultiplier = lowGradeGroupMax / 100;
  } else if (intelligenceStats < midGradeGroupMax) {
    rangeMinMultiplier = lowGradeGroupMax / 100;
    rangeMaxMultiplier = midGradeGroupMax / 100;
  } else {
    rangeMinMultiplier = midGradeGroupMax / 100;
    rangeMaxMultiplier = highGradeGroupMax / 100;
  }

  //generate random grade with the range multipliers

  //we set min = (max * minRangeMultiplier) so that we can manipulate the min.

  //original range: 0 - 100
  //if required school days is 0, then we have a non precollege
  final int courseKnowledgeAndFinalExam = (requiredSchoolDays == 0)
      ? 0
      : getRandomIntInPositiveRange(
          min: (100 * rangeMinMultiplier).round(),
          max: (100 * rangeMaxMultiplier).round(),
        );

  return Precollege(
    personId: studentID,
    schoolType: precollegeSchoolType.name,
    currentSchoolId: schoolID,
    active: active,
    //original range: 0 - required school days
    attendance: getRandomIntInPositiveRange(
      min: (requiredSchoolDays * rangeMinMultiplier).round(),
      max: (requiredSchoolDays * rangeMaxMultiplier).round(),
    ),
    //original range: 0 - required school days
    homework: getRandomIntInPositiveRange(
      min: (requiredSchoolDays * rangeMinMultiplier).round(),
      max: (requiredSchoolDays * rangeMaxMultiplier).round(),
    ),
    courseKnowledge: courseKnowledgeAndFinalExam,
    finalExam: courseKnowledgeAndFinalExam,
    lastHomeworkSubmissionDay: 0,
    lastSchoolAttendanceDay: 0,
  );
}
