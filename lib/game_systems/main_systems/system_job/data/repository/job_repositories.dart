import 'package:toplife/game_systems/main_systems/system_job/data/repository/employment_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_job/data/repository/job_relationship_repository_impl.da.dart';
import 'package:toplife/game_systems/main_systems/system_job/data/repository/job_repository_impl.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/dao/employment_dao.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/dao/job_dao.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/dao/job_relationship_dao.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/repository/employment_repository.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/repository/job_relationship_repository.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/repository/job_repository.dart';

class JobRepositories {
  final JobDao _jobDao;
  final JobRelationshipDao _jobRelationshipDao;
  final EmploymentDao _employmentDao;

  const JobRepositories({
    required JobDao jobDao,
    required JobRelationshipDao jobRelationshipDao,
    required EmploymentDao employmentDao,
  })  : _jobDao = jobDao,
        _jobRelationshipDao = jobRelationshipDao,
        _employmentDao = employmentDao;

  JobRepository get jobRepositoryImpl => JobRepositoryImpl(jobDao: _jobDao);

  JobRelationshipRepository get jobRelationshipRepositoryImpl =>
      JobRelationshipRepositoryImpl(
        jobRelationshipDao: _jobRelationshipDao,
      );

  EmploymentRepository get employmentRepositoryImpl =>
      EmploymentRepositoryImpl(employmentDao: _employmentDao);
}
