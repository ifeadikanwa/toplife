import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/main_systems/system_job/util/get_random_corporate_company_suffix.dart';
import 'package:toplife/main_systems/system_job/util/specific_company_suffix.dart';
import 'package:toplife/main_systems/system_school/degree_constants/degree_branch.dart';
import 'package:toplife/main_systems/system_school/degree_constants/degree_disciplines.dart';

class CommunicationsJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static Set<Job> list = {
    //
    Job(
      jobTitle: JobTitles.socialMediaManager,
      jobType: JobType.communication.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.business].toString(),
      qualifiedBranches:
          [DegreeBranch.marketing, DegreeBranch.advertising].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.brandManager,
      jobType: JobType.communication.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.business].toString(),
      qualifiedBranches:
          [DegreeBranch.marketing, DegreeBranch.advertising].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.marketingManager,
      jobType: JobType.communication.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.lead.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.business].toString(),
      qualifiedBranches:
          [DegreeBranch.marketing, DegreeBranch.advertising].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.copywriter,
      jobType: JobType.communication.name,
      companySuffix: getRandomCorporateCompanySuffix(),
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines:
          [DegreeDisciplines.business, DegreeDisciplines.humanities].toString(),
      qualifiedBranches: [
        DegreeBranch.marketing,
        DegreeBranch.advertising,
        DegreeBranch.languages,
        DegreeBranch.english
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.editor,
      jobType: JobType.communication.name,
      companySuffix: SpecificCompanySuffix.newspaper,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [
        DegreeDisciplines.humanities,
        DegreeDisciplines.socialScience
      ].toString(),
      qualifiedBranches: [
        DegreeBranch.languages,
        DegreeBranch.english,
        DegreeBranch.philosophy,
        DegreeBranch.sociology,
        DegreeBranch.psychology,
        DegreeBranch.criminalJustice,
        DegreeBranch.politicalScience,
        DegreeBranch.law,
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.signLanguageInterpreter,
      jobType: JobType.communication.name,
      companySuffix: SpecificCompanySuffix.production,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.humanities].toString(),
      qualifiedBranches: [DegreeBranch.languages].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.spokenLanguageInterpreter,
      jobType: JobType.communication.name,
      companySuffix: SpecificCompanySuffix.production,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.humanities].toString(),
      qualifiedBranches: [DegreeBranch.languages].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.travelAgent,
      jobType: JobType.communication.name,
      companySuffix: SpecificCompanySuffix.agency,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.humanities].toString(),
      qualifiedBranches: [
        DegreeBranch.languages,
        DegreeBranch.art,
        DegreeBranch.philosophy,
        DegreeBranch.history,
        DegreeBranch.english,
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.writer,
      jobType: JobType.communication.name,
      companySuffix: SpecificCompanySuffix.publication,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.humanities].toString(),
      qualifiedBranches: [
        DegreeBranch.languages,
        DegreeBranch.art,
        DegreeBranch.philosophy,
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.historian,
      jobType: JobType.communication.name,
      companySuffix: SpecificCompanySuffix.museum,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.humanities].toString(),
      qualifiedBranches: [DegreeBranch.history].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.museumCoordinator,
      jobType: JobType.communication.name,
      companySuffix: SpecificCompanySuffix.museum,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.humanities].toString(),
      qualifiedBranches: [DegreeBranch.history].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.museumCurator,
      jobType: JobType.communication.name,
      companySuffix: SpecificCompanySuffix.museum,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.humanities].toString(),
      qualifiedBranches: [DegreeBranch.history].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.archaeologist,
      jobType: JobType.communication.name,
      companySuffix: SpecificCompanySuffix.consultants,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.humanities].toString(),
      qualifiedBranches: [DegreeBranch.history].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.journalist,
      jobType: JobType.communication.name,
      companySuffix: SpecificCompanySuffix.consultants,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.communications.minLevelOneBasePay +
          (0.20 * GameJobPay.communications.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.communications.minLevelTwoBasePay +
          (0.20 * GameJobPay.communications.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.communications.minLevelThreeBasePay +
          (0.20 * GameJobPay.communications.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [
        DegreeDisciplines.humanities,
        DegreeDisciplines.socialScience
      ].toString(),
      qualifiedBranches: [
        DegreeBranch.philosophy,
        DegreeBranch.sociology,
        DegreeBranch.psychology,
        DegreeBranch.criminalJustice,
        DegreeBranch.politicalScience,
        DegreeBranch.law,
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),
  };
}
