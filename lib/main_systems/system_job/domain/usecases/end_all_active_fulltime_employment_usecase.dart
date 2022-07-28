import 'package:toplife/main_systems/system_job/data/repository/job_repositories.dart';
import 'package:toplife/main_systems/system_job/domain/model/employment.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';

class EndAllActiveFullTimeEmploymentUsecase {
  final JobRepositories _jobRepositories;

  const EndAllActiveFullTimeEmploymentUsecase(
      {required JobRepositories jobRepositories})
      : _jobRepositories = jobRepositories;

  Future<void> execute({required int mainPersonID, required int currentDay}) async {
    //get all active employment
    //go through them and use the job id to check if it is a fulltime or partime job
    //if it is fulltime
    //update them all to
    //-inactive
    //-last day is current day

    List<Employment> activeEmployments = await _jobRepositories
        .employmentRepositoryImpl
        .getAllActiveEmployments(mainPersonID);

    if (activeEmployments.isNotEmpty) {
      for (Employment activeEmployment in activeEmployments) {
        //get the job info
        final Job? job = await _jobRepositories.jobRepositoryImpl
            .getJob(activeEmployment.jobID);

        if (job != null) {
          //if it is a fulltime job, update it to end
          if (job.employmentType == EmploymentType.fullTime.name) {
            final updatedEmployment = activeEmployment.copyWith(
              isActive: false,
              lastDay: currentDay,
            );

            await _jobRepositories.employmentRepositoryImpl
                .updateEmployment(updatedEmployment);
          }
        }
      }
    }
  }
}
