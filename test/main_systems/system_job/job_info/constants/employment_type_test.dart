// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';

void main() {
  group("EmploymentType:", () {
    test("fulltime is an employment type", () {
      assert(EmploymentType.fullTime is EmploymentType);
    });

    test("parttime is an employment type", () {
      assert(EmploymentType.partTime is EmploymentType);
    });
  });
}
