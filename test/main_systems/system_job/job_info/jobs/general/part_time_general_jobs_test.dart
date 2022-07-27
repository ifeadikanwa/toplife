import 'package:flutter_test/flutter_test.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/jobs/general/part_time_general_jobs.dart';

void main() {
  test(
      "All jobs in part time general jobs list are parttime",
      () {
    for (var job in PartTimeGeneralJobs.list) {
      expect(job.employmentType, EmploymentType.partTime.name,
          reason: "Cause: employmentType for ${job.jobTitle}");
    }
  });
}