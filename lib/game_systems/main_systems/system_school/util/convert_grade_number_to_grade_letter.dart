import 'package:toplife/game_systems/main_systems/system_school/constants/grade.dart';

String convertGradeNumberToGradeLetter({
  required int? gradeNumber,
}) {
  //check if grade is within bounds of all the grade letters,
  //starting from highest to lowest

  //if we are given null, return undetermined grade
  if (gradeNumber == null) {
    return Grade.undetermined.letterGrade;
  }

  //A+
  //I don't add an upperbound range check so that in case of an error
  //if the grade number is over the 100 we can safely return A+
  else if (gradeNumber >= Grade.aPlus.lowerBound) {
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
