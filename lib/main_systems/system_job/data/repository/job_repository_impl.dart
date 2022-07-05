import 'package:toplife/main_systems/system_job/domain/dao/job_dao.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/domain/repository/job_repository.dart';

class JobRepositoryImpl implements JobRepository {
  final JobDao _jobDao;

  const JobRepositoryImpl({required JobDao jobDao}) : _jobDao = jobDao;

  @override
  Future<Job> createJob(Job job) async {
    return _jobDao.createJob(job);
  }

  @override
  Future<void> deleteJobTable() async {
    return _jobDao.deleteJobTable();
  }

  @override
  Future<void> dropAndRecreateJobTable() async {
    return _jobDao.dropAndRecreateJobTable();
  }

  @override
  Future<void> batchInsertJobs(Set<Job> jobsSet) async {
    return _jobDao.batchInsertJobs(jobsSet);
  }

  @override
  Future<List<Job>> getAllJobs() async {
    return _jobDao.getAllJobs();
  }

  @override
  Future<Job?> getJob(int jobID) async {
    return _jobDao.getJob(jobID);
  }

  @override
  Future<List<Job>> getFullTimeGeneralJobs() async {
    return _jobDao.getFullTimeGeneralJobs();
  }

  @override
  Future<List<Job>> getPartTimeGeneralJobs() async {
    return _jobDao.getPartTimeGeneralJobs();
  }

  @override
  Future<List<Job>> getJobsForDegreeBranch(String degreeBranch) async {
    return _jobDao.getJobsForDegreeBranch(degreeBranch);
  }

  @override
  Future<List<Job>> getJobsForDegreeDiscipline(String degreeDiscipline) async {
    return _jobDao.getJobsForDegreeDiscipline(degreeDiscipline);
  }

  @override
  Future<void> updateJob(Job job) async {
    return _jobDao.updateJob(job);
  }
}
