import 'dart:collection';

import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/game_systems/main_systems/system_job/util/get_random_law_company_suffix.dart';
import 'package:toplife/game_systems/main_systems/system_job/util/get_random_medical_company_suffix.dart';
import 'package:toplife/game_systems/main_systems/system_job/util/specific_company_suffix.dart';
import 'package:toplife/game_systems/main_systems/system_school/degree_info/degree_branch.dart';
import 'package:toplife/game_systems/main_systems/system_school/degree_info/degree_discipline.dart';

class SocialWorkJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static HashSet<Job> list = HashSet.of({
    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.librarian,
      jobType: JobType.socialWork.name,
      companySuffix: SpecificCompanySuffix.library,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.socialWork.minLevelOneBasePay +
          (0.20 * GameJobPay.socialWork.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.socialWork.minLevelTwoBasePay +
          (0.20 * GameJobPay.socialWork.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.socialWork.minLevelThreeBasePay +
          (0.20 * GameJobPay.socialWork.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [
        DegreeDiscipline.humanities,
        DegreeDiscipline.socialScience
      ].toString(),
      qualifiedBranches: [
        DegreeBranch.languages,
        DegreeBranch.english,
        DegreeBranch.philosophy,
        DegreeBranch.art,
        DegreeBranch.history,
        DegreeBranch.sociology,
        DegreeBranch.psychology,
        DegreeBranch.criminalJustice,
        DegreeBranch.politicalScience,
        DegreeBranch.law,
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.policeOfficer,
      jobType: JobType.socialWork.name,
      companySuffix: SpecificCompanySuffix.policeDepartment,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.socialWork.minLevelOneBasePay +
          (0.20 * GameJobPay.socialWork.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.socialWork.minLevelTwoBasePay +
          (0.20 * GameJobPay.socialWork.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.socialWork.minLevelThreeBasePay +
          (0.20 * GameJobPay.socialWork.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.socialScience].toString(),
      qualifiedBranches: [
        DegreeBranch.criminalJustice,
        DegreeBranch.politicalScience,
        DegreeBranch.law,
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.counselor,
      jobType: JobType.socialWork.name,
      companySuffix: SpecificCompanySuffix.school,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.socialWork.minLevelOneBasePay +
          (0.20 * GameJobPay.socialWork.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.socialWork.minLevelTwoBasePay +
          (0.20 * GameJobPay.socialWork.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.socialWork.minLevelThreeBasePay +
          (0.20 * GameJobPay.socialWork.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.socialScience].toString(),
      qualifiedBranches:
          [DegreeBranch.sociology, DegreeBranch.psychology].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.socialWorker,
      jobType: JobType.socialWork.name,
      companySuffix: SpecificCompanySuffix.city,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.socialWork.minLevelOneBasePay +
          (0.20 * GameJobPay.socialWork.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.socialWork.minLevelTwoBasePay +
          (0.20 * GameJobPay.socialWork.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.socialWork.minLevelThreeBasePay +
          (0.20 * GameJobPay.socialWork.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.socialScience].toString(),
      qualifiedBranches: [
        DegreeBranch.sociology,
        DegreeBranch.psychology,
        DegreeBranch.criminalJustice,
        DegreeBranch.law,
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.paralegal,
      jobType: JobType.socialWork.name,
      companySuffix: getRandomLawCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.socialWork.minLevelOneBasePay +
          (0.20 * GameJobPay.socialWork.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.socialWork.minLevelTwoBasePay +
          (0.20 * GameJobPay.socialWork.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.socialWork.minLevelThreeBasePay +
          (0.20 * GameJobPay.socialWork.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.socialScience].toString(),
      qualifiedBranches: [
        DegreeBranch.politicalScience,
        DegreeBranch.law,
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.psychologist,
      jobType: JobType.socialWork.name,
      companySuffix: getRandomMedicalCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.socialWork.minLevelOneBasePay +
          (0.20 * GameJobPay.socialWork.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.socialWork.minLevelTwoBasePay +
          (0.20 * GameJobPay.socialWork.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.socialWork.minLevelThreeBasePay +
          (0.20 * GameJobPay.socialWork.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.socialScience].toString(),
      qualifiedBranches: [DegreeBranch.psychology].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.probationOfficer,
      jobType: JobType.socialWork.name,
      companySuffix: SpecificCompanySuffix.court,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.socialWork.minLevelOneBasePay +
          (0.20 * GameJobPay.socialWork.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.socialWork.minLevelTwoBasePay +
          (0.20 * GameJobPay.socialWork.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.socialWork.minLevelThreeBasePay +
          (0.20 * GameJobPay.socialWork.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.socialScience].toString(),
      qualifiedBranches: [
        DegreeBranch.criminalJustice,
        DegreeBranch.politicalScience,
        DegreeBranch.law,
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),
  });
}
