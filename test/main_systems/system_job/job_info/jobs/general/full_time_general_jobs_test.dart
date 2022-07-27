import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/general/full_time_general_jobs.dart';

void main() {
  test(
      "All jobs in full time general jobs list are fulltime",
      () {
    for (var job in FullTimeGeneralJobs.list) {
      expect(job.employmentType, EmploymentType.fullTime.name,
          reason: "Cause: employmentType for ${job.jobTitle}");
    }
  });
}