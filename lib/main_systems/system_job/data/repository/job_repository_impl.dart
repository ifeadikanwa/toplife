import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_job/domain/dao/job_dao.dart';
import 'package:toplife/main_systems/system_job/domain/repository/job_repository.dart';

class JobRepositoryImpl implements JobRepository {
  final JobDao _jobDao;

  const JobRepositoryImpl({required JobDao jobDao}) : _jobDao = jobDao;

  @override
  Future<Job> createJob(Job job) async {
    return _jobDao.createJob(job);
  }

  @override
  Future<Job?> getJob(int jobID) async {
    return _jobDao.getJob(jobID);
  }

  @override
  Future<void> updateJob(Job job) async {
    return _jobDao.updateJob(job);
  }

  @override
  Future<Job?> findFullTimeJobWithJobTitle(String jobTitle) {
    return _jobDao.findFullTimeJobWithJobTitle(jobTitle);
  }

  @override
  Future<Job?> findPartTimeJobWithJobTitle(String jobTitle) {
    return _jobDao.findPartTimeJobWithJobTitle(jobTitle);
  }
}
