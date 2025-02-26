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
import 'package:toplife/game_systems/main_systems/system_school/degree_info/degree_branch.dart';
import 'package:toplife/game_systems/main_systems/system_school/degree_info/degree_discipline.dart';

class LawJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static HashSet<Job> list = HashSet.of({
    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.criminalLawyer,
      jobType: JobType.law.name,
      companySuffix: getRandomLawCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.law.minLevelOneBasePay +
          (0.20 * GameJobPay.law.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.associate.titleName,
      levelTwoBasePay: GameJobPay.law.minLevelTwoBasePay +
          (0.20 * GameJobPay.law.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.partner.titleName,
      levelThreeBasePay: GameJobPay.law.minLevelThreeBasePay +
          (0.20 * GameJobPay.law.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.law].toString(),
      qualifiedBranches: [DegreeBranch.criminalLaw].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.corporateLawyer,
      jobType: JobType.law.name,
      companySuffix: getRandomLawCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.law.minLevelOneBasePay +
          (0.20 * GameJobPay.law.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.associate.titleName,
      levelTwoBasePay: GameJobPay.law.minLevelTwoBasePay +
          (0.20 * GameJobPay.law.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.partner.titleName,
      levelThreeBasePay: GameJobPay.law.minLevelThreeBasePay +
          (0.20 * GameJobPay.law.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.law].toString(),
      qualifiedBranches: [DegreeBranch.corporateLaw].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.realEstateLawyer,
      jobType: JobType.law.name,
      companySuffix: getRandomLawCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.law.minLevelOneBasePay +
          (0.20 * GameJobPay.law.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.associate.titleName,
      levelTwoBasePay: GameJobPay.law.minLevelTwoBasePay +
          (0.20 * GameJobPay.law.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.partner.titleName,
      levelThreeBasePay: GameJobPay.law.minLevelThreeBasePay +
          (0.20 * GameJobPay.law.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.law].toString(),
      qualifiedBranches: [DegreeBranch.realEstateLaw].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.familyLawyer,
      jobType: JobType.law.name,
      companySuffix: getRandomLawCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.law.minLevelOneBasePay +
          (0.20 * GameJobPay.law.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.associate.titleName,
      levelTwoBasePay: GameJobPay.law.minLevelTwoBasePay +
          (0.20 * GameJobPay.law.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.partner.titleName,
      levelThreeBasePay: GameJobPay.law.minLevelThreeBasePay +
          (0.20 * GameJobPay.law.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.law].toString(),
      qualifiedBranches: [DegreeBranch.familyLaw].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),
  });
}
