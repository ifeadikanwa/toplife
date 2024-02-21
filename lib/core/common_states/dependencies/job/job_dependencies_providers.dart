import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/main_systems/system_job/data/dao/employment_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/repository/job_repositories.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/job_usecases.dart';

final jobRepositoriesProvider = Provider<JobRepositories>((ref) {
  final database = ref.watch(databaseProvider);
  return JobRepositories(
    jobDao: JobDaoImpl(database),
    jobRelationshipDao: JobRelationshipDaoImpl(database),
    employmentDao: EmploymentDaoImpl(database),
  );
});

final jobUsecasesProvider = Provider((ref) => JobUsecases(
      ref: ref,
    ));
