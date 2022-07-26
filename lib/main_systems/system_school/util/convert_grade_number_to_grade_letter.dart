import 'package:toplife/main_systems/system_school/constants/grade.dart';
import 'package:toplife/main_systems/system_school/constants/school_info.dart';

String convertGradeNumberToGradeLetter({
  required int gradeNumber,
  required int currentSemesterNumber,
}) {
  //if it the first semseter return undetermined grade

  //check if grade is within bounds of all the grade letters,
  //starting from highest to lowest

  if (currentSemesterNumber == SchoolInfo.firstSemester) {
    return Grade.undetermined.letterGrade;
  }

  //A+
  if (gradeNumber >= Grade.aPlus.lowerBound &&
      gradeNumber <= Grade.aPlus.upperBound) {
    return Grade.aPlus.letterGrade;
  }
  //A
  else if (gradeNumber >= Grade.a.lowerBound &&
      gradeNumber <= Grade.a.upperBound) {
    return Grade.a.letterGrade;
  }
  //A-
  else if (gradeNumber >= Grade.aMinus.lowerBound &&
      gradeNumber <= Grade.aMinus.upperBound) {
    return Grade.aMinus.letterGrade;
  }
  //B+
  else if (gradeNumber >= Grade.bPlus.lowerBound &&
      gradeNumber <= Grade.bPlus.upperBound) {
    return Grade.bPlus.letterGrade;
  }
  //B
  else if (gradeNumber >= Grade.b.lowerBound &&
      gradeNumber <= Grade.b.upperBound) {
    return Grade.b.letterGrade;
  }
  //B-
  else if (gradeNumber >= Grade.bMinus.lowerBound &&
      gradeNumber <= Grade.bMinus.upperBound) {
    return Grade.bMinus.letterGrade;
  }
  //C+
  else if (gradeNumber >= Grade.cPlus.lowerBound &&
      gradeNumber <= Grade.cPlus.upperBound) {
    return Grade.cPlus.letterGrade;
  }
  //C
  else if (gradeNumber >= Grade.c.lowerBound &&
      gradeNumber <= Grade.c.upperBound) {
    return Grade.c.letterGrade;
  }
  //C-
  else if (gradeNumber >= Grade.cMinus.lowerBound &&
      gradeNumber <= Grade.cMinus.upperBound) {
    return Grade.cMinus.letterGrade;
  }
  //D
  else if (gradeNumber >= Grade.d.lowerBound &&
      gradeNumber <= Grade.d.upperBound) {
    return Grade.d.letterGrade;
  }
  //E
  else if (gradeNumber >= Grade.e.lowerBound &&
      gradeNumber <= Grade.e.upperBound) {
    return Grade.e.letterGrade;
  }
  //F
  else {
    return Grade.f.letterGrade;
  }
}
