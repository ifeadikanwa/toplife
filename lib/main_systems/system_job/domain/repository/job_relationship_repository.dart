import 'package:toplife/main_systems/system_job/domain/model/job_relationship.dart';

abstract class JobRelationshipRepository {
  Future<JobRelationship> createJobRelationship(
      JobRelationship jobRelationship);
  Future<void> updateJobRelationship(JobRelationship jobRelationship);
  Future<List<JobRelationship>> getAllJobRelationships(int employmentID);
  Future<JobRelationship?> getSupervisor(int employmentID);
  Future<List<JobRelationship>> getAllCoworkers(int employmentID);
  Future<JobRelationship?> getJobRelationship(int jobRelationshipID);
  Future<void> deleteJobRelationship(int jobRelationshipID);
}
