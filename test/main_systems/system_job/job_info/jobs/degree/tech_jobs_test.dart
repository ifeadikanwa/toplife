import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/tech_jobs.dart';

void main() {
  test(
      "All jobs in tech jobs list is a tech job and fulltime",
      () {
    for (var job in TechJobs.list) {
      expect(job.jobType, JobType.tech.name,
          reason: "Cause: jobType for ${job.jobTitle}");

      expect(job.employmentType, EmploymentType.fullTime.name,
          reason: "Cause: employmentType for ${job.jobTitle}");
    }
  });
}