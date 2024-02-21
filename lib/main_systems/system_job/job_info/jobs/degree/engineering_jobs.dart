import 'dart:collection';

import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/main_systems/system_job/util/specific_company_suffix.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_branch.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';

class EngineeringJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static HashSet<Job> list = HashSet.of({
    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.electricalEngineer,
      jobType: JobType.engineering.name,
      companySuffix: SpecificCompanySuffix.engineering,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.engineering.minLevelOneBasePay +
          (0.20 * GameJobPay.engineering.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.engineering.minLevelTwoBasePay +
          (0.20 * GameJobPay.engineering.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.engineering.minLevelThreeBasePay +
          (0.20 * GameJobPay.engineering.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.engineering].toString(),
      qualifiedBranches: [DegreeBranch.electricalEngineering].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.mechanicalEngineer,
      jobType: JobType.engineering.name,
      companySuffix: SpecificCompanySuffix.auto,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.engineering.minLevelOneBasePay +
          (0.20 * GameJobPay.engineering.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.engineering.minLevelTwoBasePay +
          (0.20 * GameJobPay.engineering.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.engineering.minLevelThreeBasePay +
          (0.20 * GameJobPay.engineering.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.engineering].toString(),
      qualifiedBranches: [DegreeBranch.mechanicalEngineering].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.chemicalEngineer,
      jobType: JobType.engineering.name,
      companySuffix: SpecificCompanySuffix.engineering,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.engineering.minLevelOneBasePay +
          (0.20 * GameJobPay.engineering.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.engineering.minLevelTwoBasePay +
          (0.20 * GameJobPay.engineering.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.engineering.minLevelThreeBasePay +
          (0.20 * GameJobPay.engineering.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.engineering].toString(),
      qualifiedBranches: [DegreeBranch.chemicalEngineering].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),
  });
}
