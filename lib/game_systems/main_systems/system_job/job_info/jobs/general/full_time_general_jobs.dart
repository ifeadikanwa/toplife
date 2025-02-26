import 'dart:collection';

import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/game_systems/main_systems/system_job/util/specific_company_suffix.dart';
import 'package:toplife/game_systems/main_systems/system_job/util/get_random_corporate_company_suffix.dart';

class FullTimeGeneralJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  //health insurance
  //jobs with high risks have higher health insurance coverage

  //qualifiedDisciplines/qualifiedBranch: [] means no degree is required and it is open to all.

  static Set<Job> list = HashSet.of({
    //blue collar

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.carpenter,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.carpenters,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.apprentice.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.master.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.firefighter,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.fireStation,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistantChief.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.fireChief.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.plumber,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.plumbing,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.electrician,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.electricians,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.makeupArtist,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.cosmetics,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.constructionWorker,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.construction,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.apprentice.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.mechanic,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.auto,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.apprentice.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.busDriver,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.motors,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.welder,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.welding,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.apprentice.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.master.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.chef,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.restaurant,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.photographer,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.studio,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.hairStylist,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.salon,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //White Collar

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.assistant,
      jobType: JobType.whiteCollar.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.administrative.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.executive.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.customerSupportRepresentative,
      jobType: JobType.whiteCollar.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.salesRepresentative,
      jobType: JobType.whiteCollar.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.graphicDesigner,
      jobType: JobType.whiteCollar.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.receptionist,
      jobType: JobType.whiteCollar.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //Sex work
    //creates events like your partner leaving when they find out you are a sex worker
    //or your children discovering you are a sex worker and how you would handle it
    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.exoticDancer,
      jobType: JobType.sexWork.name,
      companySuffix: SpecificCompanySuffix.club,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.backup.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.pornModel,
      jobType: JobType.sexWork.name,
      companySuffix: SpecificCompanySuffix.studio,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.pornActor,
      jobType: JobType.sexWork.name,
      companySuffix: SpecificCompanySuffix.production,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.supporting.titleName,
      levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
      getsTips: false,
    ),
  });
}
