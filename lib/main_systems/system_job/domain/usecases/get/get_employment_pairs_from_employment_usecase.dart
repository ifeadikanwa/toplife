import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/employment_pair.dart';
import 'package:toplife/main_systems/system_job/domain/repository/job_repository.dart';

class GetEmploymentPairsFromEmploymentsUsecase {
  final JobRepository _jobRepository;

  const GetEmploymentPairsFromEmploymentsUsecase({
    required JobRepository jobRepository,
  }) : _jobRepository = jobRepository;

  Future<List<EmploymentPair>> execute(
      {required List<Employment> employments}) async {
    List<EmploymentPair> employmentPairs = [];

    for (var employment in employments) {
      final Job? job = await _jobRepository.getJob(employment.jobId);

      if (job != null) {
        employmentPairs.add(EmploymentPair(employment: employment, job: job));
      }
    }

    return employmentPairs;
  }
}
