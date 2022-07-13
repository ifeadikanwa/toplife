import 'dart:collection';

import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/main_systems/system_job/util/specific_company_suffix.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_disciplines.dart';

class EducationJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static HashSet<Job> list = HashSet.of({
    //
    Job(
      jobTitle: JobTitles.teacher,
      jobType: JobType.education.name,
      companySuffix: SpecificCompanySuffix.school,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.substitute.titleName,
      levelOneBasePay: GameJobPay.education.minLevelOneBasePay +
          (0.20 * GameJobPay.education.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.assistant.titleName,
      levelTwoBasePay: GameJobPay.education.minLevelTwoBasePay +
          (0.20 * GameJobPay.education.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.head.titleName,
      levelThreeBasePay: GameJobPay.education.minLevelThreeBasePay +
          (0.20 * GameJobPay.education.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDisciplines.education].toString(),
      qualifiedBranches: DegreeDisciplines.education.branches.toList().toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
    ),
  });
}
