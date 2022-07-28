import 'package:toplife/main_systems/system_job/domain/repository/job_relationship_repository.dart';
import 'package:toplife/main_systems/system_job/domain/dao/job_relationship_dao.dart';
import 'package:toplife/main_systems/system_job/domain/model/job_relationship.dart';

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
}
