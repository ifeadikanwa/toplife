import 'package:toplife/main_systems/system_job/domain/model/job.dart';

abstract class JobRepository {
  Future<Job> createJob(Job job);
  Future<void> updateJob(Job job);
  Future<List<Job>> getAllJobs();
  Future<Job?> getJob(int jobID);
  Future<List<Job>> getFullTimeGeneralJobs();
  Future<List<Job>> getPartTimeGeneralJobs();
  Future<List<Job>> getJobsForDegreeBranch(String degreeBranch);
  Future<List<Job>> getJobsForDegreeDiscipline(String degreeDiscipline);
  Future<void> deleteJobTable();
  Future<void> dropAndRecreateJobTable();
  Future<void> batchInsertJobs(Set<Job> jobsSet);
}
