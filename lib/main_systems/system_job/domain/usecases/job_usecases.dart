import 'package:toplife/main_systems/system_job/data/repository/job_repositories.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/check_if_qualified_for_job_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/employ_person_for_fulltime_job_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/end_all_active_fulltime_employment_usecase.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/get_a_valid_list_of_fulltime_jobs_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/school_usecases.dart';

class JobUsecases {
  final JobRepositories _jobRepositories;
  final SchoolUsecases _schoolUsecases;

  const JobUsecases({
    required JobRepositories jobRepositories,
    required SchoolUsecases schoolUsecases,
  })  : _jobRepositories = jobRepositories,
        _schoolUsecases = schoolUsecases;

  CheckIfQualifiedForFullTimeJobUsecase
      get checkIfQualifiedForFullTimeJobUsecase =>
          CheckIfQualifiedForFullTimeJobUsecase(
            jobRepositories: _jobRepositories,
            schoolUsecases: _schoolUsecases,
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
      GetAValidListOfFullTimeJobsUsecase();
}
