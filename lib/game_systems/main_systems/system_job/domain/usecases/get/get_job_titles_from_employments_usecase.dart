import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/repository/job_repository.dart';

class GetJobTitlesFromEmploymentsUsecase {
  final JobRepository _jobRepository;

  const GetJobTitlesFromEmploymentsUsecase({
    required JobRepository jobRepository,
  }) : _jobRepository = jobRepository;

  Future<String> execute({required List<Employment> employments}) async {
    //list is empty then say unemployed

    //if not loop through the list
    //get the job
    //get the job title
    //add it to the string
    //if it is not the first item in the list add a comma before

    if (employments.isEmpty) {
      return TextConstants.unemployed;
    } else {
      final jobTitles = StringBuffer("");

      for (int i = 0; i < employments.length; i++) {
        final Job? job = await _jobRepository.getJob(employments[i].jobId);

        if (i == 0) {
          if (job != null) {
            jobTitles.write(job.jobTitle);
          }
        } else {
          if (job != null) {
            jobTitles.write(", ");
            jobTitles.write(job.jobTitle);
          }
        }
      }

      return jobTitles.toString();
    }
  }
}
