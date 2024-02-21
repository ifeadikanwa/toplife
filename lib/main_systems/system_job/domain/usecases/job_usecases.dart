import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/job/job_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/school/school_dependencies_providers.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/add_location_to_jobs_list._usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/check_if_qualified_for_job_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/employ_person_for_fulltime_job_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/end_all_active_fulltime_employment_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/get/get_employment_pairs_from_employment_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/get/get_job_titles_from_employments_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/get_a_valid_list_of_fulltime_jobs_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/watch/watch_active_employments_usecase.dart';

class JobUsecases {
  final Ref _ref;

  const JobUsecases({required Ref ref}) : _ref = ref;

  CheckIfQualifiedForFullTimeJobUsecase
      get checkIfQualifiedForFullTimeJobUsecase =>
          CheckIfQualifiedForFullTimeJobUsecase(
            jobRepositories: _ref.read(jobRepositoriesProvider),
            schoolUsecases: _ref.read(schoolUsecasesProvider),
            personUsecases: _ref.read(personUsecasesProvider),
          );

  EndAllActiveFullTimeEmploymentUsecase
      get endAllActiveFullTimeEmploymentUsecase =>
          EndAllActiveFullTimeEmploymentUsecase(
            jobRepositories: _ref.read(jobRepositoriesProvider),
          );

  EmployPersonForFullTimeJobUsecase get employPersonForFullTimeJobUsecase =>
      EmployPersonForFullTimeJobUsecase(
        endAllActiveFullTimeEmploymentUsecase:
            endAllActiveFullTimeEmploymentUsecase,
        jobRepositories: _ref.read(jobRepositoriesProvider),
      );

  GetAValidListOfFullTimeJobsUsecase get getAValidListOfFullTimeJobsUsecase =>
      GetAValidListOfFullTimeJobsUsecase(addLocationToJobsListUsecase);

  WatchActiveEmploymentsUsecase get watchActiveEmploymentsUsecase =>
      WatchActiveEmploymentsUsecase(
        employmentRepository:
            _ref.read(jobRepositoriesProvider).employmentRepositoryImpl,
      );

  GetJobTitlesFromEmploymentsUsecase get getJobTitlesFromEmploymentsUsecase =>
      GetJobTitlesFromEmploymentsUsecase(
        jobRepository: _ref.read(jobRepositoriesProvider).jobRepositoryImpl,
      );

  GetEmploymentPairsFromEmploymentsUsecase
      get getEmploymentPairsFromEmploymentsUsecase =>
          GetEmploymentPairsFromEmploymentsUsecase(
            jobRepository: _ref.read(jobRepositoriesProvider).jobRepositoryImpl,
          );

  AddLocationToJobsListUsecase get addLocationToJobsListUsecase =>
      AddLocationToJobsListUsecase(_ref.read(personUsecasesProvider));
}
