import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/main_systems/system_job/util/specific_company_suffix.dart';
import 'package:toplife/main_systems/system_job/util/get_random_corporate_company_suffix.dart';

class PartTimeGeneralJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  //health insurance
  //none or low

  //qualifiedDisciplines/qualifiedBranch: [] means no degree is required and it is open to all.

  static Set<Job> list = {
    //blue collar

    //
    Job(
      jobTitle: JobTitles.personalShopper,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.studio,
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.securityOfficer,
      jobType: JobType.blueCollar.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.personalDriver,
      jobType: JobType.blueCollar.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.warehouseWorker,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.warehouse,
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.janitor,
      jobType: JobType.blueCollar.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.mailCarrier,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.postOffice,
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.server,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.restaurant,
      employmentType: EmploymentType.partTime.name,
      getsTips: true,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.retailSalesAssociate,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.store,
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.cook,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.restaurant,
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.bartender,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.bar,
      employmentType: EmploymentType.partTime.name,
      getsTips: true,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.barista,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.cafe,
      employmentType: EmploymentType.partTime.name,
      getsTips: true,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.caregiver,
      jobType: JobType.blueCollar.name,
      companySuffix: SpecificCompanySuffix.care,
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
    ),

    //White collar

    //
    Job(
      jobTitle: JobTitles.bankTeller,
      jobType: JobType.whiteCollar.name,
      companySuffix: SpecificCompanySuffix.bank,
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.cashier,
      jobType: JobType.whiteCollar.name,
      companySuffix: SpecificCompanySuffix.store,
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.tutor,
      jobType: JobType.whiteCollar.name,
      companySuffix: SpecificCompanySuffix.studyCenter,
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.deskClerk,
      jobType: JobType.whiteCollar.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
    ),

    //Sex work
    //
    Job(
      jobTitle: JobTitles.exoticDancer,
      jobType: JobType.sexWork.name,
      companySuffix: SpecificCompanySuffix.club,
      employmentType: EmploymentType.partTime.name,
      getsTips: true,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.pornModel,
      jobType: JobType.sexWork.name,
      companySuffix: SpecificCompanySuffix.studio,
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.pornActor,
      jobType: JobType.sexWork.name,
      companySuffix: SpecificCompanySuffix.production,
      employmentType: EmploymentType.partTime.name,
      levelOneTitle: LevelTitle.partTime.titleName,
      levelOneBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.partTime.titleName,
      levelTwoBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      levelThreeTitle: LevelTitle.partTime.titleName,
      levelThreeBasePay: GameJobPay.generalPartTime.minLevelOneBasePay +
          (0.20 * GameJobPay.generalPartTime.minLevelOneBasePay).ceil(),
      qualifiedDisciplines: [].toString(),
      qualifiedBranches: [].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.none.percentage,
    ),
  };
}
