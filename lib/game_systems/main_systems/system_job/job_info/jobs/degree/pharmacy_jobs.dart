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

class PharmacyJobs {
  //pay
  //level x = minlevelx + 1-30% for variability

  static HashSet<Job> list = HashSet.of({
    //
    Job(
      id: DatabaseConstants.dummyId,
      jobTitle: JobTitles.pharmacist,
      jobType: JobType.pharmacy.name,
      companySuffix: SpecificCompanySuffix.pharmacy,
      employmentType: EmploymentType.fullTime.name,
      levelOneTitle: LevelTitle.entryLevel.titleName,
      levelOneBasePay: GameJobPay.pharmacy.minLevelOneBasePay +
          (0.20 * GameJobPay.pharmacy.minLevelOneBasePay).ceil(),
      levelTwoTitle: LevelTitle.junior.titleName,
      levelTwoBasePay: GameJobPay.pharmacy.minLevelTwoBasePay +
          (0.20 * GameJobPay.pharmacy.minLevelTwoBasePay).ceil(),
      levelThreeTitle: LevelTitle.senior.titleName,
      levelThreeBasePay: GameJobPay.pharmacy.minLevelThreeBasePay +
          (0.20 * GameJobPay.pharmacy.minLevelThreeBasePay).ceil(),
      qualifiedDisciplines: [DegreeDiscipline.pharmacy].toString(),
      qualifiedBranches: [DegreeBranch.pharmacy].toString(),
      healthInsuranceCoverage: HealthInsuranceCoverage.mid.percentage,
      getsTips: false,
    ),
  });
}
