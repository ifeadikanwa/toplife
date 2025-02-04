import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/repository/job_relationship_repository.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/dao/job_relationship_dao.dart';

class JobRelationshipRepositoryImpl implements JobRelationshipRepository {
  final JobRelationshipDao _jobRelationshipDao;

  const JobRelationshipRepositoryImpl(
      {required JobRelationshipDao jobRelationshipDao})
      : _jobRelationshipDao = jobRelationshipDao;

  @override
  Future<JobRelationship> createJobRelationship(
      JobRelationship jobRelationship) async {
    return _jobRelationshipDao.createJobRelationship(jobRelationship);
  }

  @override
  Future<void> deleteJobRelationship(int jobRelationshipID) async {
    return _jobRelationshipDao.deleteJobRelationship(jobRelationshipID);
  }

  @override
  Future<List<JobRelationship>> getAllCoworkers(int employmentID) async {
    return _jobRelationshipDao.getAllCoworkers(employmentID);
  }

  @override
  Future<JobRelationship?> getSupervisor(int employmentID) async {
    return _jobRelationshipDao.getSupervisor(employmentID);
  }

  @override
  Future<List<JobRelationship>> getAllJobRelationships(
    int employmentID,
  ) async {
    return _jobRelationshipDao.getAllJobRelationships(employmentID);
  }

  @override
  Future<JobRelationship?> getJobRelationship(
    int jobRelationshipID,
  ) async {
    return _jobRelationshipDao.getJobRelationship(jobRelationshipID);
  }

  @override
  Future<void> updateJobRelationship(
    JobRelationship jobRelationship,
  ) async {
    return _jobRelationshipDao.updateJobRelationship(jobRelationship);
  }

  @override
  Stream<List<JobRelationship>> watchAllJobRelationships(int employmentID) {
    return _jobRelationshipDao.watchAllJobRelationships(employmentID);
  }

  @override
  Stream<JobRelationship?> watchJobRelationship(int jobRelationshipID) {
    return _jobRelationshipDao.watchJobRelationship(jobRelationshipID);
  }
}
