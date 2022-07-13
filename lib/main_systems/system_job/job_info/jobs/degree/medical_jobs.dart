import 'dart:collection';

import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/main_systems/system_job/util/get_random_medical_company_suffix.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_branch.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_disciplines.dart';

class MedicalJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static HashSet<Job> list = HashSet.of({
    //20%
    Job(
      jobTitle: JobTitles.surgeon,
      jobType: JobType.medical.name,
      companySuffix: getRandomMedicalCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.medical.minLevelOneBasePay +
          (0.20 * GameJobPay.medical.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.chiefResident.titleName,
      levelTwoBasePay: GameJobPay.medical.minLevelTwoBasePay +
          (0.20 * GameJobPay.medical.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.medicalDirector.titleName,
      levelThreeBasePay: GameJobPay.medical.minLevelThreeBasePay +
          (0.20 * GameJobPay.medical.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.medical].toString(),
      qualifiedBranches: [DegreeBranch.surgery].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),

    //17%
    Job(
      jobTitle: JobTitles.neurologyPhysician,
      jobType: JobType.medical.name,
      companySuffix: getRandomMedicalCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.medical.minLevelOneBasePay +
          (0.17 * GameJobPay.medical.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.chiefResident.titleName,
      levelTwoBasePay: GameJobPay.medical.minLevelTwoBasePay +
          (0.17 * GameJobPay.medical.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.medicalDirector.titleName,
      levelThreeBasePay: GameJobPay.medical.minLevelThreeBasePay +
          (0.17 * GameJobPay.medical.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.medical].toString(),
      qualifiedBranches: [DegreeBranch.neurology].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),

    //14%
    Job(
      jobTitle: JobTitles.pediatricsPhysician,
      jobType: JobType.medical.name,
      companySuffix: getRandomMedicalCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.medical.minLevelOneBasePay +
          (0.14 * GameJobPay.medical.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.chiefResident.titleName,
      levelTwoBasePay: GameJobPay.medical.minLevelTwoBasePay +
          (0.14 * GameJobPay.medical.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.medicalDirector.titleName,
      levelThreeBasePay: GameJobPay.medical.minLevelThreeBasePay +
          (0.14 * GameJobPay.medical.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.medical].toString(),
      qualifiedBranches: [DegreeBranch.pediatrics].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),

    //12%
    Job(
      jobTitle: JobTitles.pathologyPhysician,
      jobType: JobType.medical.name,
      companySuffix: getRandomMedicalCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.medical.minLevelOneBasePay +
          (0.12 * GameJobPay.medical.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.chiefResident.titleName,
      levelTwoBasePay: GameJobPay.medical.minLevelTwoBasePay +
          (0.12 * GameJobPay.medical.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.medicalDirector.titleName,
      levelThreeBasePay: GameJobPay.medical.minLevelThreeBasePay +
          (0.12 * GameJobPay.medical.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.medical].toString(),
      qualifiedBranches: [DegreeBranch.pathology].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),

    //4%
    Job(
      jobTitle: JobTitles.nurse,
      jobType: JobType.medical.name,
      companySuffix: getRandomMedicalCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.medical.minLevelOneBasePay +
          (0.04 * GameJobPay.medical.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.chiefResident.titleName,
      levelTwoBasePay: GameJobPay.medical.minLevelTwoBasePay +
          (0.04 * GameJobPay.medical.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.medicalDirector.titleName,
      levelThreeBasePay: GameJobPay.medical.minLevelThreeBasePay +
          (0.04 * GameJobPay.medical.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.nursing].toString(),
      qualifiedBranches: [DegreeBranch.nursing].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),
  });
}
