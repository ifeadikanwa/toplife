// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/school_category.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';

void main() {
  group("SchoolType:", () {
    test("elementary school name suffix and school category is correct", () {
      expect(
        SchoolType.elementarySchool.schoolNameSuffix,
        "",
        reason: "school name suffix",
      );

      expect(
        SchoolType.elementarySchool.schoolCategory,
        SchoolCategory.precollege,
        reason: "school category",
      );
    });
    test("middle school name suffix and school category is correct", () {
      expect(
        SchoolType.middleSchool.schoolNameSuffix,
        "",
        reason: "school name suffix",
      );

      expect(
        SchoolType.middleSchool.schoolCategory,
        SchoolCategory.precollege,
        reason: "school category",
      );
    });
    test("high school name suffix and school category is correct", () {
      expect(
        SchoolType.highSchool.schoolNameSuffix,
        "",
        reason: "school name suffix",
      );

      expect(
        SchoolType.highSchool.schoolCategory,
        SchoolCategory.precollege,
        reason: "school category",
      );
    });
    test(
        "undergraduateSchool school name suffix and school category is correct",
        () {
      expect(
        SchoolType.undergraduateSchool.schoolNameSuffix,
        "University",
        reason: "school name suffix",
      );
      expect(
        SchoolType.undergraduateSchool.schoolCategory,
        SchoolCategory.college,
        reason: "school category",
      );
    });

    test("graduateSchool school name suffix and school category is correct",
        () {
      expect(
        SchoolType.graduateSchool.schoolNameSuffix,
        "University",
        reason: "school name suffix",
      );
      expect(
        SchoolType.graduateSchool.schoolCategory,
        SchoolCategory.college,
        reason: "school category",
      );
    });

    test("doctorateSchool school name suffix and school category is correct",
        () {
      expect(
        SchoolType.doctorateSchool.schoolNameSuffix,
        "University",
        reason: "school name suffix",
      );
      expect(
        SchoolType.doctorateSchool.schoolCategory,
        SchoolCategory.college,
        reason: "school category",
      );
    });

    test("medicalSchool school name suffix and school category is correct", () {
      expect(
        SchoolType.medicalSchool.schoolNameSuffix,
        "Medical School",
        reason: "school name suffix",
      );
      expect(
        SchoolType.medicalSchool.schoolCategory,
        SchoolCategory.college,
        reason: "school category",
      );
    });

    test("lawSchool school name suffix and school category is correct", () {
      expect(
        SchoolType.lawSchool.schoolNameSuffix,
        "Law School",
        reason: "school name suffix",
      );
      expect(
        SchoolType.lawSchool.schoolCategory,
        SchoolCategory.college,
        reason: "school category",
      );
    });

    test("nursingSchool school name suffix and school category is correct", () {
      expect(
        SchoolType.nursingSchool.schoolNameSuffix,
        "Nursing School",
        reason: "school name suffix",
      );
      expect(
        SchoolType.nursingSchool.schoolCategory,
        SchoolCategory.college,
        reason: "school category",
      );
    });

    test("pharmacySchool school name suffix and school category is correct",
        () {
      expect(
        SchoolType.pharmacySchool.schoolNameSuffix,
        "Pharmacy School",
        reason: "school name suffix",
      );
      expect(
        SchoolType.pharmacySchool.schoolCategory,
        SchoolCategory.college,
        reason: "school category",
      );
    });

    test(
        "teacherEducationProgram school name suffix and school category is correct",
        () {
      expect(
        SchoolType.teacherEducationProgram.schoolNameSuffix,
        "Teachers Academy",
        reason: "school name suffix",
      );
      expect(
        SchoolType.teacherEducationProgram.schoolCategory,
        SchoolCategory.college,
        reason: "school category",
      );
    });
  });
}
