import 'package:toplife/main_systems/system_job/domain/model/job.dart';

abstract class JobDao {
  Future<Job> createJob(Job job);
  Future<void> updateJob(Job job);
  Future<Job?> getJob(int jobID);
  Future<Job?> findJobWithJobTitle(String jobTitle);
}
