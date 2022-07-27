import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/degree/science_jobs.dart';

void main() {
  test(
      "All jobs in science jobs list is a science job and fulltime",
      () {
    for (var job in ScienceJobs.list) {
      expect(job.jobType, JobType.science.name,
          reason: "Cause: jobType for ${job.jobTitle}");

      expect(job.employmentType, EmploymentType.fullTime.name,
          reason: "Cause: employmentType for ${job.jobTitle}");
    }
  });
}