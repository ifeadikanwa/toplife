import 'package:toplife/main_systems/system_job/data/dao/employment_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/repository/employment_repository_impl.dart';
import 'package:toplife/main_systems/system_job/data/repository/job_relationship_repository_impl.da.dart';
import 'package:toplife/main_systems/system_job/data/repository/job_repository_impl.dart';
import 'package:toplife/main_systems/system_job/domain/repository/employment_repository.dart';
import 'package:toplife/main_systems/system_job/domain/repository/job_relationship_repository.dart';
import 'package:toplife/main_systems/system_job/domain/repository/job_repository.dart';

class JobRepositories {
  JobRepository get jobRepositoryImpl =>
      JobRepositoryImpl(jobDao: JobDaoImpl());

  JobRelationshipRepository get jobRelationshipRepositoryImpl =>
      JobRelationshipRepositoryImpl(
        jobRelationshipDao: JobRelationshipDaoImpl(),
      );

  EmploymentRepository get employmentRepositoryImpl =>
      EmploymentRepositoryImpl(employmentDao: EmploymentDaoImpl());
}
