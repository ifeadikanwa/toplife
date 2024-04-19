import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/main_systems/system_job/data/dao/employment_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/repository/job_repositories.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/job_usecases.dart';

part 'job_dependencies_providers.g.dart';

@riverpod
JobRepositories jobRepositories(JobRepositoriesRef ref) {
  final database = ref.watch(databaseProvider);

  return JobRepositories(
    jobDao: JobDaoImpl(database),
    jobRelationshipDao: JobRelationshipDaoImpl(database),
    employmentDao: EmploymentDaoImpl(database),
  );
}

@riverpod
JobUsecases jobUsecases(JobUsecasesRef ref) {
  return JobUsecases(ref: ref);
}
