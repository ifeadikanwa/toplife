import 'dart:collection';

import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/main_systems/system_job/util/get_random_corporate_company_suffix.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_branch.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';

class FinanceJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static HashSet<Job> list = HashSet.of({
    //
    Job(
      jobTitle: JobTitles.financialAnalyst,
      jobType: JobType.finance.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.finance.minLevelOneBasePay +
          (0.20 * GameJobPay.finance.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.finance.minLevelTwoBasePay +
          (0.20 * GameJobPay.finance.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.finance.minLevelThreeBasePay +
          (0.20 * GameJobPay.finance.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.business].toString(),
      qualifiedBranches: [
        DegreeBranch.finance,
        DegreeBranch.accounting,
        DegreeBranch.economics
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.creditAnalyst,
      jobType: JobType.finance.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.finance.minLevelOneBasePay +
          (0.20 * GameJobPay.finance.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.finance.minLevelTwoBasePay +
          (0.20 * GameJobPay.finance.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.finance.minLevelThreeBasePay +
          (0.20 * GameJobPay.finance.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.business].toString(),
      qualifiedBranches: [
        DegreeBranch.finance,
        DegreeBranch.accounting,
        DegreeBranch.economics
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.businessReporter,
      jobType: JobType.finance.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.finance.minLevelOneBasePay +
          (0.20 * GameJobPay.finance.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.finance.minLevelTwoBasePay +
          (0.20 * GameJobPay.finance.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.finance.minLevelThreeBasePay +
          (0.20 * GameJobPay.finance.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.business].toString(),
      qualifiedBranches: [
        DegreeBranch.finance,
        DegreeBranch.accounting,
        DegreeBranch.economics,
        DegreeBranch.marketing
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.businessManager,
      jobType: JobType.finance.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.finance.minLevelOneBasePay +
          (0.20 * GameJobPay.finance.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.finance.minLevelTwoBasePay +
          (0.20 * GameJobPay.finance.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.finance.minLevelThreeBasePay +
          (0.20 * GameJobPay.finance.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.business].toString(),
      qualifiedBranches: [
        DegreeBranch.finance,
        DegreeBranch.accounting,
        DegreeBranch.economics
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.businessConsultant,
      jobType: JobType.finance.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.finance.minLevelOneBasePay +
          (0.20 * GameJobPay.finance.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.finance.minLevelTwoBasePay +
          (0.20 * GameJobPay.finance.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.finance.minLevelThreeBasePay +
          (0.20 * GameJobPay.finance.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.business].toString(),
      qualifiedBranches: [
        DegreeBranch.finance,
        DegreeBranch.accounting,
        DegreeBranch.economics,
        DegreeBranch.marketing
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.financialAdvisor,
      jobType: JobType.finance.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.finance.minLevelOneBasePay +
          (0.20 * GameJobPay.finance.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.finance.minLevelTwoBasePay +
          (0.20 * GameJobPay.finance.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.finance.minLevelThreeBasePay +
          (0.20 * GameJobPay.finance.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.business].toString(),
      qualifiedBranches: [
        DegreeBranch.finance,
        DegreeBranch.accounting,
        DegreeBranch.economics,
        DegreeBranch.marketing
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.budgetAnalyst,
      jobType: JobType.finance.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.finance.minLevelOneBasePay +
          (0.20 * GameJobPay.finance.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.finance.minLevelTwoBasePay +
          (0.20 * GameJobPay.finance.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.finance.minLevelThreeBasePay +
          (0.20 * GameJobPay.finance.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.business].toString(),
      qualifiedBranches: [
        DegreeBranch.finance,
        DegreeBranch.accounting,
        DegreeBranch.economics,
        DegreeBranch.marketing
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.accountant,
      jobType: JobType.finance.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.finance.minLevelOneBasePay +
          (0.20 * GameJobPay.finance.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.finance.minLevelTwoBasePay +
          (0.20 * GameJobPay.finance.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.finance.minLevelThreeBasePay +
          (0.20 * GameJobPay.finance.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [
        DegreeDiscipline.business,
        DegreeDiscipline.naturalScience
      ].toString(),
      qualifiedBranches: [
        DegreeBranch.finance,
        DegreeBranch.accounting,
        DegreeBranch.mathematics
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.investmentAdvisor,
      jobType: JobType.finance.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.finance.minLevelOneBasePay +
          (0.20 * GameJobPay.finance.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.finance.minLevelTwoBasePay +
          (0.20 * GameJobPay.finance.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.finance.minLevelThreeBasePay +
          (0.20 * GameJobPay.finance.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.business].toString(),
      qualifiedBranches:
          [DegreeBranch.finance, DegreeBranch.accounting].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.actuary,
      jobType: JobType.finance.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.finance.minLevelOneBasePay +
          (0.20 * GameJobPay.finance.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.finance.minLevelTwoBasePay +
          (0.20 * GameJobPay.finance.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.finance.minLevelThreeBasePay +
          (0.20 * GameJobPay.finance.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [
        DegreeDiscipline.business,
        DegreeDiscipline.naturalScience
      ].toString(),
      qualifiedBranches: [
        DegreeBranch.finance,
        DegreeBranch.accounting,
        DegreeBranch.economics,
        DegreeBranch.mathematics
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),
  });
}
