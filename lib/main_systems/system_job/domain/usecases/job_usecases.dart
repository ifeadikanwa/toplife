import 'package:toplife/main_systems/system_job/data/repository/job_repositories.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/add_location_to_jobs_list._usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/check_if_qualified_for_job_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/employ_person_for_fulltime_job_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/end_all_active_fulltime_employment_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/get/get_employment_pairs_from_employment_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/get/get_job_titles_from_employments_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/get_a_valid_list_of_fulltime_jobs_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/watch/watch_active_employments_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/school_usecases.dart';

class JobUsecases {
  final JobRepositories _jobRepositories;
  final SchoolUsecases _schoolUsecases;
  final PersonUsecases _personUsecases;

  const JobUsecases({
    required JobRepositories jobRepositories,
    required SchoolUsecases schoolUsecases,
    required PersonUsecases personUsecases,
  })  : _jobRepositories = jobRepositories,
        _schoolUsecases = schoolUsecases,
        _personUsecases = personUsecases;

  CheckIfQualifiedForFullTimeJobUsecase
      get checkIfQualifiedForFullTimeJobUsecase =>
          CheckIfQualifiedForFullTimeJobUsecase(
            jobRepositories: _jobRepositories,
            schoolUsecases: _schoolUsecases,
            personUsecases: _personUsecases,
          );

  EndAllActiveFullTimeEmploymentUsecase
      get endAllActiveFullTimeEmploymentUsecase =>
          EndAllActiveFullTimeEmploymentUsecase(
            jobRepositories: _jobRepositories,
          );

  EmployPersonForFullTimeJobUsecase get employPersonForFullTimeJobUsecase =>
      EmployPersonForFullTimeJobUsecase(
        endAllActiveFullTimeEmploymentUsecase:
            endAllActiveFullTimeEmploymentUsecase,
        jobRepositories: _jobRepositories,
      );

  GetAValidListOfFullTimeJobsUsecase get getAValidListOfFullTimeJobsUsecase =>
      GetAValidListOfFullTimeJobsUsecase(addLocationToJobsListUsecase);

  WatchActiveEmploymentsUsecase get watchActiveEmploymentsUsecase =>
      WatchActiveEmploymentsUsecase(
        employmentRepository: _jobRepositories.employmentRepositoryImpl,
      );

  GetJobTitlesFromEmploymentsUsecase get getJobTitlesFromEmploymentsUsecase =>
      GetJobTitlesFromEmploymentsUsecase(
        jobRepository: _jobRepositories.jobRepositoryImpl,
      );

  GetEmploymentPairsFromEmploymentsUsecase
      get getEmploymentPairsFromEmploymentsUsecase =>
          GetEmploymentPairsFromEmploymentsUsecase(
            jobRepository: _jobRepositories.jobRepositoryImpl,
          );

  AddLocationToJobsListUsecase get addLocationToJobsListUsecase =>
      AddLocationToJobsListUsecase(_personUsecases);
}
