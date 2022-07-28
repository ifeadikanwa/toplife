import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/school_info.dart';

void main() {
  group("SchoolInfo:", () {
    test("daysInASemseter is 4", () {
      expect(SchoolInfo.daysInASemester, 4);
    });

    test("semesterNotStarted number is 0", () {
      expect(SchoolInfo.semesterNotStarted, 0);
    });

     test("newSemesterGradeReset number is 0", () {
      expect(SchoolInfo.newSemesterGradeReset, 0);
    });

    test("firstSemester number is 1", () {
      expect(SchoolInfo.firstSemester, 1);
    });

    test("noScholarship number is 0", () {
      expect(SchoolInfo.noScholarship, 0);
    });

    test("defaultclassDurationInMinutes is 240", () {
      expect(SchoolInfo.defaultclassDurationInMinutes, 240);
    });

    test("higherclassDurationInMinutes is 300", () {
      expect(SchoolInfo.higherclassDurationInMinutes, 300);
    });

    test("highestclassDurationInMinutes is 360", () {
      expect(SchoolInfo.highestclassDurationInMinutes, 360);
    });

    test("undergraduateDegreeBaseCost is 0", () {
      expect(SchoolInfo.undergraduateDegreeBaseCost, 0);
    });

    test("undergraduateTotalSemesters is 4", () {
      expect(SchoolInfo.undergraduateTotalSemesters, 4);
    });

    test("graduateDegreeBaseCost is 0", () {
      expect(SchoolInfo.graduateDegreeBaseCost, 0);
    });

    test("graduateTotalSemesters is 2", () {
      expect(SchoolInfo.graduateTotalSemesters, 2);
    });

    test("doctorateDegreeBaseCost is 0", () {
      expect(SchoolInfo.doctorateDegreeBaseCost, 0);
    });

    test("doctorateTotalSemesters is 4", () {
      expect(SchoolInfo.doctorateTotalSemesters, 4);
    });

    test("lawSchoolDegreeBaseCost is 0", () {
      expect(SchoolInfo.lawSchoolDegreeBaseCost, 0);
    });

    test("lawSchoolTotalSemesters is 3", () {
      expect(SchoolInfo.lawSchoolTotalSemesters, 3);
    });

    test("nursingSchoolDegreeBaseCost is 0", () {
      expect(SchoolInfo.nursingSchoolDegreeBaseCost, 0);
    });

    test("nursingSchoolTotalSemesters is 3", () {
      expect(SchoolInfo.nursingSchoolTotalSemesters, 3);
    });

    test("pharmacySchoolDegreeBaseCost is 0", () {
      expect(SchoolInfo.pharmacySchoolDegreeBaseCost, 0);
    });

    test("pharmacySchoolTotalSemesters is 3", () {
      expect(SchoolInfo.pharmacySchoolTotalSemesters, 3);
    });

    test("medicalSchoolDegreeBaseCost is 0", () {
      expect(SchoolInfo.medicalSchoolDegreeBaseCost, 0);
    });

    test("medicalSchoolTotalSemesters is 6", () {
      expect(SchoolInfo.medicalSchoolTotalSemesters, 6);
    });

    test("teacherSchoolDegreeBaseCost is 0", () {
      expect(SchoolInfo.teacherSchoolDegreeBaseCost, 0);
    });

    test("teacherSchoolTotalSemesters is 2", () {
      expect(SchoolInfo.teacherSchoolTotalSemesters, 2);
    });

  });
}
