import 'dart:collection';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/communications_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/creative_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/education_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/engineering_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/finance_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/law_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/medical_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/pharmacy_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/science_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/social_work_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/degree/tech_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/general/full_time_general_jobs.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/jobs/general/part_time_general_jobs.dart';

class GameJobs {
  //This is the official list of jobs in the game.
  //A job with a new name is a new job.
  //If the name of a job is changed it will be considered a new job by the game.

  //I use hashset so that it is an unordered list and element positions are randomized
  static HashSet<Job> jobs = HashSet.of({
    // medical
    ...MedicalJobs.list,
    // whiteCollar, blueCollar & sexWork part time general
    ...PartTimeGeneralJobs.list,
    // whiteCollar, blueCollar & sexWork full time general
    ...FullTimeGeneralJobs.list,
    // education
    ...EducationJobs.list,
    // creative
    ...CreativeJobs.list,
    // communication
    ...CommunicationsJobs.list,
    // pharmacy
    ...PharmacyJobs.list,
    // science
    ...ScienceJobs.list,
    // engineering
    ...EngineeringJobs.list,
    // finance
    ...FinanceJobs.list,
    // socialWork
    ...SocialWorkJobs.list,
    // law
    ...LawJobs.list,
    // tech
    ...TechJobs.list,
  });

  static const String emptyListString = "[]";

  static Set<Job> getFullTimeGeneralJobs() {
    //get jobs that are full time and require no degrees
    final fullTimeJobs = jobs
        .where((job) =>
            job.employmentType == EmploymentType.fullTime.name &&
            job.qualifiedDisciplines == emptyListString)
        .toList();

    fullTimeJobs.shuffle();

    return fullTimeJobs.toSet();
  }

  static Set<Job> getPartTimeGeneralJobs() {
    //get jobs that are part time and require no degrees
    final partTimeJobs = jobs
        .where((job) =>
            job.employmentType == EmploymentType.partTime.name &&
            job.qualifiedDisciplines == emptyListString)
        .toList();

    partTimeJobs.shuffle();

    return partTimeJobs.toSet();
  }

  static Set<Job> getFullTimeJobsForDegreeBranch(
      {required String degreeBranch}) {
    //get fulltime jobs that are require a specified degree

    final degreeJobs = jobs
        .where((job) =>
            job.employmentType == EmploymentType.fullTime.name &&
            job.qualifiedBranches.contains(degreeBranch))
        .toList();

    degreeJobs.shuffle();

    return degreeJobs.toSet();
  }

  static Set<Job> getTenRandomDegreeJobs() {
    final degreeJobs = jobs
        .where((job) =>
            job.employmentType == EmploymentType.fullTime.name &&
            !(job.qualifiedDisciplines == emptyListString))
        .toList();

    degreeJobs.shuffle();

    return degreeJobs.take(10).toSet();
  }
}
