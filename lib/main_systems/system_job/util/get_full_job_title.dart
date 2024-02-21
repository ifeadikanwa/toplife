import 'package:toplife/core/data_source/drift_database/database_provider.dart';

String getFullJobTitle(int currentJobLevel, Job job) {
  if (currentJobLevel == 1) {
    return "${job.levelOneTitle} ${job.jobTitle}";
  } else if (currentJobLevel == 2) {
    return "${job.levelTwoTitle} ${job.jobTitle}";
  } else {
    return "${job.levelThreeTitle} ${job.jobTitle}";
  }
}
