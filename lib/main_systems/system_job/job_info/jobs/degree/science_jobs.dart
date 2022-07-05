import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/main_systems/system_job/util/specific_company_suffix.dart';
import 'package:toplife/main_systems/system_school/degree_constants/degree_branch.dart';
import 'package:toplife/main_systems/system_school/degree_constants/degree_disciplines.dart';

class ScienceJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static Set<Job> list = {
    //
    Job(
      jobTitle: JobTitles.biologist,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches: [DegreeBranch.biology].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.biochemist,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches:
          [DegreeBranch.biology, DegreeBranch.chemistry].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.zoologist,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches:
          [DegreeBranch.biology, DegreeBranch.chemistry].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.labScientist,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches: [
        DegreeBranch.biology,
        DegreeBranch.chemistry,
        DegreeBranch.physics,
        DegreeBranch.astronomy
      ].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.healthTechnician,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches:
          [DegreeBranch.biology, DegreeBranch.chemistry].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.chemist,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches: [DegreeBranch.chemistry].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.forensicTechnician,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches: [DegreeBranch.chemistry].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.physicist,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches: [DegreeBranch.physics].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.metallurgist,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches: [DegreeBranch.physics].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.meteorologist,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches:
          [DegreeBranch.physics, DegreeBranch.astronomy].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.planetariumDirector,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.trainee.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches: [DegreeBranch.astronomy].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.climatologist,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches: [DegreeBranch.astronomy].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.statistician,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches: [DegreeBranch.mathematics].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),

    //
    Job(
      jobTitle: JobTitles.informationAnalyst,
      jobType: JobType.science.name,
      companySuffix: SpecificCompanySuffix.lab,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.intern.titleName,
      levelOneBasePay: GameJobPay.science.minLevelOneBasePay +
          (0.20 * GameJobPay.science.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.science.minLevelTwoBasePay +
          (0.20 * GameJobPay.science.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.science.minLevelThreeBasePay +
          (0.20 * GameJobPay.science.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.naturalScience].toString(),
      qualifiedBranches: [DegreeBranch.mathematics].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
    ),
  };
}
