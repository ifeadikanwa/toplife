import 'dart:collection';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_job/job_info/game_jobs.dart';

class GetAValidListOfFullTimeJobsUsecase {
  Set<Job> execute(List<Degree> degrees) {
    //takes a list of the users current degree
    //it creates a list of possible jobs for all the degrees
    //Iget a random list of 12 degree jobs
    // Get a list of general jobs
    //It takes up to 4 jobs from the degrees list
    //It takes up to 4 jobs from the discipline list
    //It takes up to 4 general jobs

    //Hashset creates a unordered list so I don't have to handle randomizing myself

    const int maxNumberOfJobsInList = 12;

    HashSet<Job> degreeJobs = HashSet.of({});

    for (Degree degree in degrees) {
      degreeJobs.addAll(
        GameJobs.getFullTimeJobsForDegreeBranch(degreeBranch: degree.branch),
      );
    }

    HashSet<Job> randomJobs = HashSet.of(GameJobs.getTenRandomDegreeJobs());

    //get up to 4 degree jobs
    //get up to 4 discipline jobs
    //fill the remaining space till 12 with general jobs

    HashSet<Job> finalListOfJobs = HashSet.of({});

    finalListOfJobs.addAll(
      degreeJobs.take(4),
    );

    finalListOfJobs.addAll(
      randomJobs.take(4),
    );

    //the number of general jobs to get is determined by how much space we have to fill in the final job list.
    final int numberOfGeneralJobsToGet =
        maxNumberOfJobsInList - finalListOfJobs.length;

    finalListOfJobs.addAll(
      GameJobs.getFullTimeGeneralJobs().take(numberOfGeneralJobsToGet),
    );

    return finalListOfJobs;
  }
}
