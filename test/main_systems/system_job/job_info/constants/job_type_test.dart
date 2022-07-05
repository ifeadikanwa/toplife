// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';

void main() {
  group("Job Types:", () {
    test("there are 14 job types", () {
      expect(JobType.values.length, 14);
    });

    test("medical is a job type", () {
      assert(JobType.medical is JobType);
    });

     test("whiteCollar is a job type", () {
      assert(JobType.whiteCollar is JobType);
    });

     test("blueCollar is a job type", () {
      assert(JobType.blueCollar is JobType);
    });

     test("education is a job type", () {
      assert(JobType.education is JobType);
    });

     test("creative is a job type", () {
      assert(JobType.creative is JobType);
    });

     test("communications is a job type", () {
      assert(JobType.communication is JobType);
    });

     test("pharmacy is a job type", () {
      assert(JobType.pharmacy is JobType);
    });

     test("science is a job type", () {
      assert(JobType.science is JobType);
    });

     test("engineering is a job type", () {
      assert(JobType.engineering is JobType);
    });

     test("finance is a job type", () {
      assert(JobType.finance is JobType);
    });

     test("socialWork is a job type", () {
      assert(JobType.socialWork is JobType);
    });

     test("law is a job type", () {
      assert(JobType.law is JobType);
    });

     test("tech is a job type", () {
      assert(JobType.tech is JobType);
    });

     test("sexWork is a job type", () {
      assert(JobType.sexWork is JobType);
    });

  
  });
}
