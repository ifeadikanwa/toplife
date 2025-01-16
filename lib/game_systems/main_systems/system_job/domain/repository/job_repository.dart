import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class JobRepository {
  Future<Job> createJob(Job job);
  Future<void> updateJob(Job job);
  Future<Job?> getJob(int jobID);
  Future<Job?> findFullTimeJobWithJobTitle(String jobTitle);
  Future<Job?> findPartTimeJobWithJobTitle(String jobTitle);
}
