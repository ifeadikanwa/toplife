import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class JobRelationshipDao {
  Future<JobRelationship> createJobRelationship(
      JobRelationship jobRelationship);
  Future<void> updateJobRelationship(JobRelationship jobRelationship);
  Future<List<JobRelationship>> getAllJobRelationships(int employmentID);
  Stream<List<JobRelationship>> watchAllJobRelationships(int employmentID);
  Future<JobRelationship?> getSupervisor(int employmentID);
  Future<List<JobRelationship>> getAllCoworkers(int employmentID);
  Future<JobRelationship?> getJobRelationship(int jobRelationshipID);
  Stream<JobRelationship?> watchJobRelationship(int jobRelationshipID);
  Future<void> deleteJobRelationship(int jobRelationshipID);
}
