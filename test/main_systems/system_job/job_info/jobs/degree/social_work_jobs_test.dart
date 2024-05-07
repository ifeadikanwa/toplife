import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/social_work_jobs.dart';

void main() {
  test(
      "All jobs in socialWork jobs list is a socialWork job and fulltime",
      () {
    for (var job in SocialWorkJobs.list) {
      expect(job.jobType, JobType.socialWork.name,
          reason: "Cause: jobType for ${job.jobTitle}");

      expect(job.employmentType, EmploymentType.fullTime.name,
          reason: "Cause: employmentType for ${job.jobTitle}");
    }
  });
}