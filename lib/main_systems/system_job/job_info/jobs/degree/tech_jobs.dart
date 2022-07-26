import 'dart:collection';

import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/main_systems/system_job/util/get_random_tech_company_suffix.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_branch.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';

class TechJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static HashSet<Job> list = HashSet.of({
    //
    Job(
      jobTitle: JobTitles.gameDeveloper,
      jobType: JobType.tech.name,
      companySuffix: getRandomTechCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.tech.minLevelOneBasePay +
          (0.20 * GameJobPay.tech.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.tech.minLevelTwoBasePay +
          (0.20 * GameJobPay.tech.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.tech.minLevelThreeBasePay +
          (0.20 * GameJobPay.tech.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.engineering].toString(),
      qualifiedBranches: [DegreeBranch.computerScience].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.webDeveloper,
      jobType: JobType.tech.name,
      companySuffix: getRandomTechCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.tech.minLevelOneBasePay +
          (0.20 * GameJobPay.tech.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.tech.minLevelTwoBasePay +
          (0.20 * GameJobPay.tech.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.tech.minLevelThreeBasePay +
          (0.20 * GameJobPay.tech.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.engineering].toString(),
      qualifiedBranches: [DegreeBranch.computerScience].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.mobileDeveloper,
      jobType: JobType.tech.name,
      companySuffix: getRandomTechCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.tech.minLevelOneBasePay +
          (0.20 * GameJobPay.tech.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.tech.minLevelTwoBasePay +
          (0.20 * GameJobPay.tech.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.tech.minLevelThreeBasePay +
          (0.20 * GameJobPay.tech.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.engineering].toString(),
      qualifiedBranches: [DegreeBranch.computerScience].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),
  });
}
