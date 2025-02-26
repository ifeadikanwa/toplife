import 'dart:collection';

import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/game_systems/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/game_systems/main_systems/system_job/util/get_random_medical_company_suffix.dart';
import 'package:toplife/game_systems/main_systems/system_school/degree_info/degree_branch.dart';
import 'package:toplife/game_systems/main_systems/system_school/degree_info/degree_discipline.dart';

class MedicalJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static HashSet<Job> list = HashSet.of({
    //20%
    Job(
      id: DatabaseConstants.dummyId,
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
      qualifiedDisciplines: [DegreeDiscipline.medical].toString(),
      qualifiedBranches: [DegreeBranch.surgery].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //17%
    Job(
      id: DatabaseConstants.dummyId,
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
      qualifiedDisciplines: [DegreeDiscipline.medical].toString(),
      qualifiedBranches: [DegreeBranch.neurology].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //14%
    Job(
      id: DatabaseConstants.dummyId,
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
      qualifiedDisciplines: [DegreeDiscipline.medical].toString(),
      qualifiedBranches: [DegreeBranch.pediatrics].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //12%
    Job(
      id: DatabaseConstants.dummyId,
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
      qualifiedDisciplines: [DegreeDiscipline.medical].toString(),
      qualifiedBranches: [DegreeBranch.pathology].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
      getsTips: false,
    ),

    //4%
    Job(
      id: DatabaseConstants.dummyId,
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
      qualifiedDisciplines: [DegreeDiscipline.nursing].toString(),
      qualifiedBranches: [DegreeBranch.nursing].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),
  });
}
