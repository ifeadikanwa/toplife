import 'package:toplife/main_systems/system_job/domain/model/job.dart';

String getFullJobTitle(int currentJobLevel, Job job) {
  if (currentJobLevel == 1) {
    return "${job.levelOneTitle} ${job.jobTitle}";
  } else if (currentJobLevel == 2) {
    return "${job.levelTwoTitle} ${job.jobTitle}";
  } else {
    return "${job.levelThreeTitle} ${job.jobTitle}";
  }
}
