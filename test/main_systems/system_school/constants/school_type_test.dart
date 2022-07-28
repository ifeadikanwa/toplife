// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';

void main() {
  group("SchoolType:", () {
    test("undergraduateSchool is a school type", () {
      assert(SchoolType.undergraduateSchool is SchoolType);
    });

    test("graduateSchool is a school type", () {
      assert(SchoolType.graduateSchool is SchoolType);
    });

    test("doctorateSchool is a school type", () {
      assert(SchoolType.doctorateSchool is SchoolType);
    });

    test("medicalSchool is a school type", () {
      assert(SchoolType.medicalSchool is SchoolType);
    });

    test("lawSchool is a school type", () {
      assert(SchoolType.lawSchool is SchoolType);
    });

    test("pharmacySchool is a school type", () {
      assert(SchoolType.pharmacySchool is SchoolType);
    });

    test("nursingSchool is a school type", () {
      assert(SchoolType.nursingSchool is SchoolType);
    });

    test("teacherEducationProgram is a school type", () {
      assert(SchoolType.teacherEducationProgram is SchoolType);
    });
  });
}
