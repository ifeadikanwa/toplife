// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';

void main() {
  group("Health insurance coverage:", () {
    test("there are 4 types of health insurance coverage", () {
      expect(HealthInsuranceCoverage.values.length, 4);
    });
    test("none health insurance coverage covers 0%", () {
      expect(HealthInsuranceCoverage.none.percentage, 0);
    });

    test("low health insurance coverage covers 30%", () {
      expect(HealthInsuranceCoverage.low.percentage, 30);
    });

    test("mid health insurance coverage covers 50%", () {
      expect(HealthInsuranceCoverage.mid.percentage, 50);
    });

    test("high health insurance coverage covers 80%", () {
      expect(HealthInsuranceCoverage.high.percentage, 80);
    });
  });
}
