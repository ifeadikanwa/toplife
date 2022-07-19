import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/main_systems/system_job/domain/model/employment.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/job_interview_response.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/data/repository/job_repositories.dart';
import 'package:toplife/main_systems/system_school/constants/degree_level.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/school_usecases.dart';

class CheckIfQualifiedForFullTimeJobUsecase {
  final JobRepositories _jobRepositories;
  final SchoolUsecases _schoolUsecases;

  const CheckIfQualifiedForFullTimeJobUsecase({
    required JobRepositories jobRepositories,
    required SchoolUsecases schoolUsecases,
  })  : _jobRepositories = jobRepositories,
        _schoolUsecases = schoolUsecases;

  Future<JobInterviewResponse> execute({
    required Job job,
    required int personID,
  }) async {
    //if it is a general job they are qualified

    //if it is not a general job
    //Stage 1: check if they qualify based on past employment
    //try to find the job in the job table
    //if you find the job: check if the person has an employment for that job
    //if they do then they are qualified
    //if you dont find the job or the person does not have employment for the job move to the next stage
    //Stage 2: check if they qualify based on degree
    //get all the persons completed school
    //go through the completed school and get the degree object for each completed school
    //check if any of the degree discipline - branch combo match the qualified discipline and branch for the job
    //if you find a match they qualify
    //else they dont qualify

    //what if the user has a higher degree level than their previous employment
    //get degree and employment info first
    //then use that to decide how to act
    //check if they are both null or one is not null or they are both not null(then compare and use the one that gives a higher job level)

    final bool isGeneralJob = job.qualifiedDisciplines == "[]";

    //look for a record of the job in the job table
    final jobRecord = await _jobRepositories.jobRepositoryImpl
        .findFullTimeJobWithJobTitle(job.jobTitle);

    if (jobRecord != null && jobRecord.id != null) {
      List<Employment> employments = await _jobRepositories
          .employmentRepositoryImpl
          .getAllEmploymentsForAJob(personID, jobRecord.id!);

      //if the list is not empty then the player has worked this job before and therefore qualifies for another employment.
      if (employments.isNotEmpty) {
        //the most recent employment is at the top of the list
        //if the player was fired from their most recent employment for this job then there is a 50/50 chance they will not qualify
        if (employments[0].wasFired == true) {
          final bool isAccepted = Chance.getTrueOrFalse();
          if (isAccepted) {
            return JobInterviewResponse(
              accepted: isAccepted,
              qualifiedByEmployment: true,
              jobLevel: employments[0].currentLevel,
            );
          } else {
            return const JobInterviewResponse(
              accepted: false,
              reason: "Bad recommendation from previous employer",
            );
          }
        }
        //if the player wasnt fired they immediately qualify
        else {
          return JobInterviewResponse(
            accepted: true,
            qualifiedByEmployment: true,
            jobLevel: employments[0].currentLevel,
          );
        }
      }

      //if the employment list was empty but it is a general job, then the player is qualified but for level 1
      //there is a chance you won't be hired
      if (isGeneralJob) {
        final accepted = Chance.getTrueOrFalseBasedOnPercentageChance(
          trueChancePercentage: 70,
        );
        if (accepted) {
          return const JobInterviewResponse(
            accepted: true,
            qualifiedByEmployment: true,
          );
        } else {
          return const JobInterviewResponse(
            accepted: false,
            reason:
                "Uhm actually has already been filled, sorry. We should really take the job ad down.",
          );
        }
      }
    }

    //if jobRecord is null then the player has never interacted with this job so we want to check if they qualify by degree
    final List<Degree> completedDegrees = await _schoolUsecases
        .getCompletedDegreesUsecase
        .execute(personID: personID);

    for (Degree degree in completedDegrees) {
      if (job.qualifiedDisciplines.contains(degree.discipline) &&
          job.qualifiedBranches.contains(degree.branch)) {
        //then they have a qualifying degree,
        //if they qualify by degree there is a small chance they still won't get the job
        final accepted = Chance.getTrueOrFalseBasedOnPercentageChance(
          trueChancePercentage: 80,
        );

        if (accepted) {
          //they got the job
          //check the degree level so you can give them an appropriate position
          final DegreeLevel? degreeLevel = await _schoolUsecases
              .getHighestAttainedDegreeLevelForACompletedDegree
              .execute(personID, degree.id!);

          //use the degree level to determine the job level
          late final int jobLevel;

          if (degreeLevel == DegreeLevel.doctorate) {
            jobLevel = 3;
          } else if (degreeLevel == DegreeLevel.master) {
            jobLevel = 2;
          } else {
            jobLevel = 1;
          }

          return JobInterviewResponse(
            accepted: true,
            qualifiedByDegree: true,
            jobLevel: jobLevel,
          );
        }
        else {
          //they didn't get the job
          return const JobInterviewResponse(
            accepted: false,
            reason:
                "We actually just found someone for the job. Good luck out there",
          );
        }
      }
    }

    //if it gets to this point then the person does not qualify for the job based on past employment or degree
    return const JobInterviewResponse(
      accepted: false,
      reason:
          "The hiring manager shredded your resume as soon as it came in. You obviously know nothing about this job.",
    );
  }
}
