import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_job/util/get_full_job_title.dart';

void main() {
  late Job job;
  setUp(() {
    job = const Job(
      id: 0,
      jobTitle: "jobTitle",
      jobType: "jobType",
      companySuffix: "companySuffix",
      employmentType: "employmentType",
      levelOneTitle: "levelOneTitle",
      levelOneBasePay: 1,
      levelTwoTitle: "levelTwoTitle",
      levelTwoBasePay: 2,
      levelThreeTitle: "levelThreeTitle",
      levelThreeBasePay: 3,
      qualifiedDisciplines: "qualifiedDisciplines",
      qualifiedBranches: "qualifiedBranches",
      healthInsuranceCoverage: 10,
      getsTips: false,
    );
  });
  group("getFullJobTitle:", () {
    test("when current level is 1 correct job title is returned", () {
      expect(getFullJobTitle(1, job), "levelOneTitle jobTitle");
    });

    test("when current level is 2 correct job title is returned", () {
      expect(getFullJobTitle(2, job), "levelTwoTitle jobTitle");
    });

    test("when current level is 3 correct job title is returned", () {
      expect(getFullJobTitle(3, job), "levelThreeTitle jobTitle");
    });

    test("when current level is more than 3 level 3 title is returned", () {
      expect(getFullJobTitle(5, job), "levelThreeTitle jobTitle");
    });
  });
}
