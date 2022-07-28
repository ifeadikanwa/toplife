import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/job_info/game_jobs.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';

void main() {
  group("Game Jobs:", () {
    //test that the list of jobs
    //- includes every job type
    //- includes part time jobs and full time jobs

    final Set<Job> jobs = GameJobs.jobs;

    test("Every job type is included in the list of game jobs", () {
      for (var jobType in JobType.values) {
        //get all jobs that match the given jobType
        final result = jobs.where((job) => job.jobType == jobType.name);
        //test that the result has at least one job
        expect(
          result,
          hasLength(greaterThan(0)),
          reason: "Cause: ${jobType.name}",
        );
      }
    });

    test("the list of game jobs includes part time and full time jobs", () {
      for (var employmentType in EmploymentType.values) {
        //get all jobs that match the given employmentType
        final result =
            jobs.where((job) => job.employmentType == employmentType.name);
        //test that the result has at least one job
        expect(
          result,
          hasLength(greaterThan(0)),
          reason: "Cause: ${employmentType.name}",
        );
      }
    });

    test("emptyListString is []", () {
      expect(GameJobs.emptyListString, "[]");
    });

    test(
        "getFullTimeGeneralJobs returns only fulltime jobs with no degree requirements",
        () {
      final result = GameJobs.getFullTimeGeneralJobs();
      final List<Job> wrongJobs = result
          .where((job) =>
              job.employmentType != EmploymentType.fullTime.name ||
              job.qualifiedDisciplines != GameJobs.emptyListString)
          .toList();
      expect(wrongJobs, []);
    });

    test(
        "getPartTimeGeneralJobs returns only parttime jobs with no degree requirements",
        () {
      final result = GameJobs.getPartTimeGeneralJobs();
      final List<Job> wrongJobs = result
          .where((job) =>
              job.employmentType != EmploymentType.partTime.name ||
              job.qualifiedDisciplines != GameJobs.emptyListString)
          .toList();
      expect(wrongJobs, []);
    });

    test(
        "getFullTimeJobsForDegreeBranch returns only fulltime jobs with that degree requirements for all degree branches in the game",
        () {
      for (var discipline in DegreeDiscipline.values) {
        for (var degreeBranch in discipline.branches) {
          final result = GameJobs.getFullTimeJobsForDegreeBranch(
            degreeBranch: degreeBranch,
          );
          final List<Job> wrongJobs = result
              .where((job) =>
                  job.employmentType != EmploymentType.fullTime.name ||
                  !job.qualifiedBranches.contains(degreeBranch))
              .toList();
          expect(wrongJobs, []);
        }
      }
    });

    test(
        "getTenRandomDegreeJobs returns only fulltime jobs with degree requirements",
        () {
      final result = GameJobs.getTenRandomDegreeJobs();
      final List<Job> wrongJobs = result
          .where((job) =>
              job.employmentType != EmploymentType.fullTime.name ||
              job.qualifiedDisciplines == GameJobs.emptyListString)
          .toList();
      expect(wrongJobs, []);
      expect(result, hasLength(10));
    });
  });
}
