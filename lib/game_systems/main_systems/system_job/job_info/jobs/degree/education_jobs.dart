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
import 'package:toplife/game_systems/main_systems/system_school/degree_info/degree_discipline.dart';

class EducationJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static HashSet<Job> list = HashSet.of({
    //
    Job(
      id: DatabaseConstants.dummyId,
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
      qualifiedDisciplines: [DegreeDiscipline.education].toString(),
      qualifiedBranches:
          DegreeDiscipline.education.branches.toList().toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.low.percentage,
      getsTips: false,
    ),
  });
}
