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
import 'package:toplife/game_systems/main_systems/system_school/degree_info/degree_branch.dart';
import 'package:toplife/game_systems/main_systems/system_school/degree_info/degree_discipline.dart';

class CreativeJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static HashSet<Job> list = HashSet.of({
    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.videographer,
      jobType: JobType.creative.name,
      companySuffix: SpecificCompanySuffix.studio,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.creative.minLevelOneBasePay +
          (0.20 * GameJobPay.creative.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.creative.minLevelTwoBasePay +
          (0.20 * GameJobPay.creative.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.creative.minLevelThreeBasePay +
          (0.20 * GameJobPay.creative.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.humanities].toString(),
      qualifiedBranches: [DegreeBranch.art].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.artDirector,
      jobType: JobType.creative.name,
      companySuffix: SpecificCompanySuffix.studio,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.creative.minLevelOneBasePay +
          (0.20 * GameJobPay.creative.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.creative.minLevelTwoBasePay +
          (0.20 * GameJobPay.creative.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.creative.minLevelThreeBasePay +
          (0.20 * GameJobPay.creative.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.humanities].toString(),
      qualifiedBranches: [DegreeBranch.art].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.floralDesigner,
      jobType: JobType.creative.name,
      companySuffix: SpecificCompanySuffix.studio,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.creative.minLevelOneBasePay +
          (0.20 * GameJobPay.creative.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.creative.minLevelTwoBasePay +
          (0.20 * GameJobPay.creative.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.creative.minLevelThreeBasePay +
          (0.20 * GameJobPay.creative.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.humanities].toString(),
      qualifiedBranches: [DegreeBranch.art].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.illustrator,
      jobType: JobType.creative.name,
      companySuffix: SpecificCompanySuffix.studio,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.creative.minLevelOneBasePay +
          (0.20 * GameJobPay.creative.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.creative.minLevelTwoBasePay +
          (0.20 * GameJobPay.creative.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.creative.minLevelThreeBasePay +
          (0.20 * GameJobPay.creative.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.humanities].toString(),
      qualifiedBranches: [DegreeBranch.art].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.galleryCurator,
      jobType: JobType.creative.name,
      companySuffix: SpecificCompanySuffix.gallery,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.creative.minLevelOneBasePay +
          (0.20 * GameJobPay.creative.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.creative.minLevelTwoBasePay +
          (0.20 * GameJobPay.creative.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.creative.minLevelThreeBasePay +
          (0.20 * GameJobPay.creative.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.humanities].toString(),
      qualifiedBranches: [DegreeBranch.art].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.tattooArtist,
      jobType: JobType.creative.name,
      companySuffix: SpecificCompanySuffix.tattoo,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.creative.minLevelOneBasePay +
          (0.20 * GameJobPay.creative.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.creative.minLevelTwoBasePay +
          (0.20 * GameJobPay.creative.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.creative.minLevelThreeBasePay +
          (0.20 * GameJobPay.creative.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.humanities].toString(),
      qualifiedBranches: [DegreeBranch.art].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.archivist,
      jobType: JobType.creative.name,
      companySuffix: SpecificCompanySuffix.museum,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.creative.minLevelOneBasePay +
          (0.20 * GameJobPay.creative.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.creative.minLevelTwoBasePay +
          (0.20 * GameJobPay.creative.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.creative.minLevelThreeBasePay +
          (0.20 * GameJobPay.creative.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.humanities].toString(),
      qualifiedBranches: [DegreeBranch.art, DegreeBranch.history].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.producer,
      jobType: JobType.creative.name,
      companySuffix: SpecificCompanySuffix.production,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.creative.minLevelOneBasePay +
          (0.20 * GameJobPay.creative.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.creative.minLevelTwoBasePay +
          (0.20 * GameJobPay.creative.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.creative.minLevelThreeBasePay +
          (0.20 * GameJobPay.creative.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.humanities].toString(),
      qualifiedBranches: [DegreeBranch.art].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.fashionDesigner,
      jobType: JobType.creative.name,
      companySuffix: SpecificCompanySuffix.studio,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.creative.minLevelOneBasePay +
          (0.20 * GameJobPay.creative.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.creative.minLevelTwoBasePay +
          (0.20 * GameJobPay.creative.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.creative.minLevelThreeBasePay +
          (0.20 * GameJobPay.creative.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.humanities].toString(),
      qualifiedBranches: [DegreeBranch.art].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.animator,
      jobType: JobType.creative.name,
      companySuffix: SpecificCompanySuffix.studio,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.creative.minLevelOneBasePay +
          (0.20 * GameJobPay.creative.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.creative.minLevelTwoBasePay +
          (0.20 * GameJobPay.creative.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.creative.minLevelThreeBasePay +
          (0.20 * GameJobPay.creative.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.humanities].toString(),
      qualifiedBranches: [DegreeBranch.art].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),

    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.galleryManager,
      jobType: JobType.creative.name,
      companySuffix: SpecificCompanySuffix.gallery,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.creative.minLevelOneBasePay +
          (0.20 * GameJobPay.creative.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.creative.minLevelTwoBasePay +
          (0.20 * GameJobPay.creative.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.creative.minLevelThreeBasePay +
          (0.20 * GameJobPay.creative.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.humanities].toString(),
      qualifiedBranches: [DegreeBranch.art].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),
  });
}
