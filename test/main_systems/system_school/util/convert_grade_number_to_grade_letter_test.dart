import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/grade.dart';
import 'package:toplife/main_systems/system_school/util/convert_grade_number_to_grade_letter.dart';

void main() {
  group("ConvertGradeNumberToGradeLetter:", () {
    test("returns A+ if grade number is over 100(error protection)", () {
      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: 121,
      );

      expect(result, "A+");
    });

    test("returns A+ if number grade is within A+ range", () {
      final int numberGrade = Grade.aPlus.lowerBound + 3;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "A+");
    });

    test("returns A if number grade is within A range", () {
      final int numberGrade = Grade.a.lowerBound + 3;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "A");
    });

    test("returns A- if number grade is within A- range", () {
      final int numberGrade = Grade.aMinus.lowerBound + 2;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "A-");
    });

    test("returns B+ if number grade is within B+ range", () {
      final int numberGrade = Grade.bPlus.lowerBound + 2;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "B+");
    });

    test("returns B if number grade is within B range", () {
      final int numberGrade = Grade.b.lowerBound + 2;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "B");
    });

    test("returns B- if number grade is within B- range", () {
      final int numberGrade = Grade.bMinus.lowerBound + 2;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "B-");
    });

    test("returns C+ if number grade is within C+ range", () {
      final int numberGrade = Grade.cPlus.lowerBound + 2;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "C+");
    });

    test("returns C if number grade is within C range", () {
      final int numberGrade = Grade.c.lowerBound + 2;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "C");
    });

    test("returns C- if number grade is within C- range", () {
      final int numberGrade = Grade.cMinus.lowerBound + 2;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "C-");
    });

    test("returns D if number grade is within D range", () {
      final int numberGrade = Grade.d.lowerBound + 3;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "D");
    });

    test("returns E if number grade is within E range", () {
      final int numberGrade = Grade.e.lowerBound + 3;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "E");
    });

    test("returns F if number grade is within F range", () {
      final int numberGrade = Grade.f.lowerBound + 3;

      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: numberGrade,
      );

      expect(result, "F");
    });

    test("returns F if number grade is less than 0(error protection)", () {
      final String result = convertGradeNumberToGradeLetter(
        gradeNumber: -5,
      );

      expect(result, "F");
    });
  });
}
