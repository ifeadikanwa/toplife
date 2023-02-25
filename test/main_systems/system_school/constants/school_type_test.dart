// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';

void main() {
  group("SchoolType:", () {
    test("undergraduateSchool school name suffix is University", () {
      expect(SchoolType.undergraduateSchool.schoolNameSuffix, "University");
    });

    test("graduateSchool school name suffix is University", () {
      expect(SchoolType.graduateSchool.schoolNameSuffix, "University");
    });

    test("doctorateSchool school name suffix is University", () {
      expect(SchoolType.doctorateSchool.schoolNameSuffix, "University");
    });

    test("medicalSchool school name suffix is Medical School", () {
      expect(SchoolType.medicalSchool.schoolNameSuffix, "Medical School");
    });

    test("lawSchool school name suffix is Law School", () {
      expect(SchoolType.lawSchool.schoolNameSuffix, "Law School");
    });

    test("nursingSchool school name suffix is Nursing School", () {
      expect(SchoolType.nursingSchool.schoolNameSuffix, "Nursing School");
    });

    test("pharmacySchool school name suffix is Pharmacy School", () {
      expect(SchoolType.pharmacySchool.schoolNameSuffix, "Pharmacy School");
    });

    test("teacherEducationProgram school name suffix is Teachers Academy", () {
      expect(SchoolType.teacherEducationProgram.schoolNameSuffix,
          "Teachers Academy");
    });
  });
}
