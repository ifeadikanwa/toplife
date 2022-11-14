import 'package:flutter/material.dart';
import 'package:toplife/core/common_widgets/app_screen_content_templates/scrollable_screen_content.dart';
import 'package:toplife/core/common_widgets/app_screens/top_level_screen.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/sections/history_section.dart';
import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/helper_widgets/sections/opportunities_section.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopLevelScreen(
      title: TextConstants.work,
      child: ScrollableScreenContent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            //A provider should provide the needed arguments for current section
            // CurrentSection(
            //   currentSchool: workScreenArgs.currentSchool,
            //   currentEmployments: workScreenArgs.currentEmployments,
            // ),
            HistorySection(),
            OpportunitiesSection(),
          ],
        ),
      ),
    );
  }
}

// final testWorkScreen = WorkScreen(
//   currentSchool: SchoolPair(
//     school: School(
//         mainPersonID: 1,
//         name: "Sunshine University",
//         grades: 23,
//         attendance: 8,
//         project: 7,
//         exam: 9,
//         classStartTime: 7,
//         classEndTime: 0,
//         totalSemesterNumber: 7,
//         currentSemesterNumber: 8,
//         schoolType: "schoolType",
//         currentDayInSemester: 0,
//         semesterStartDay: 0,
//         degreeID: 1,
//         degreeLevel: "degreeLevel",
//         schoolFeesPerSemester: 98,
//         scholarshipPercentage: 7,
//         hasTakenLeave: false,
//         isActive: true,
//         isCompleted: false,
//         wasExpelled: false),
//     degree: Degree(
//         discipline: "discipline", branch: "Nursing", isSpecialDegree: false),
//   ),
//   currentEmployments: [
//     JobPair(
//       employment: Employment(
//           jobID: 1,
//           mainPersonID: 2,
//           companyName: "Uber Corp",
//           startTime: 3,
//           shiftLength: 8,
//           dayOff: 0,
//           isDayShift: true,
//           currentLevel: 2,
//           currentPay: 500,
//           raisesGiven: 2,
//           jobPerformance: 69,
//           daysOfConsistentGoodPerformance: 2,
//           vacationDaysLeft: 1,
//           onLeave: false,
//           firstDay: 45,
//           lastDay: 0,
//           wasFired: false,
//           isActive: true),
//       job: Job(
//         jobTitle: JobTitles.webDeveloper,
//         jobType: JobType.tech.name,
//         companySuffix: getRandomTechCompanySuffix(),
//         employmentType: EmploymentType.fullTime.name,
//         levelOneTitle: LevelTitle.entryLevel.titleName,
//         levelOneBasePay: GameJobPay.tech.minLevelOneBasePay +
//             (0.20 * GameJobPay.tech.minLevelOneBasePay).ceil(),
//         levelTwoTitle: LevelTitle.junior.titleName,
//         levelTwoBasePay: GameJobPay.tech.minLevelTwoBasePay +
//             (0.20 * GameJobPay.tech.minLevelTwoBasePay).ceil(),
//         levelThreeTitle: LevelTitle.senior.titleName,
//         levelThreeBasePay: GameJobPay.tech.minLevelThreeBasePay +
//             (0.20 * GameJobPay.tech.minLevelThreeBasePay).ceil(),
//         qualifiedDisciplines: [DegreeDiscipline.engineering].toString(),
//         qualifiedBranches: [DegreeBranch.computerScience].toString(),
//         healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
//       ),
//     ),
//     JobPair(
//       employment: Employment(
//           jobID: 1,
//           mainPersonID: 2,
//           companyName: "Uber Corp",
//           startTime: 3,
//           shiftLength: 8,
//           dayOff: 0,
//           isDayShift: true,
//           currentLevel: 3,
//           currentPay: 500,
//           raisesGiven: 2,
//           jobPerformance: 90,
//           daysOfConsistentGoodPerformance: 2,
//           vacationDaysLeft: 1,
//           onLeave: false,
//           firstDay: 45,
//           lastDay: 0,
//           wasFired: false,
//           isActive: true),
//       job: Job(
//         jobTitle: JobTitles.mobileDeveloper,
//         jobType: JobType.tech.name,
//         companySuffix: getRandomTechCompanySuffix(),
//         employmentType: EmploymentType.fullTime.name,
//         levelOneTitle: LevelTitle.entryLevel.titleName,
//         levelOneBasePay: GameJobPay.tech.minLevelOneBasePay +
//             (0.20 * GameJobPay.tech.minLevelOneBasePay).ceil(),
//         levelTwoTitle: LevelTitle.junior.titleName,
//         levelTwoBasePay: GameJobPay.tech.minLevelTwoBasePay +
//             (0.20 * GameJobPay.tech.minLevelTwoBasePay).ceil(),
//         levelThreeTitle: LevelTitle.senior.titleName,
//         levelThreeBasePay: GameJobPay.tech.minLevelThreeBasePay +
//             (0.20 * GameJobPay.tech.minLevelThreeBasePay).ceil(),
//         qualifiedDisciplines: [DegreeDiscipline.engineering].toString(),
//         qualifiedBranches: [DegreeBranch.computerScience].toString(),
//         healthInsuranceCoverage: HealthInsuranceCoverage.high.percentage,
//       ),
//     ),
//   ],
// );

//import 'package:toplife/main_game/presentation/top_level_screens/work/widgets/work_screen.dart';
// import 'package:toplife/main_systems/system_job/domain/model/employment.dart';
// import 'package:toplife/main_systems/system_job/domain/model/info_models/job_pair.dart';
// import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
// import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
// import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
// import 'package:toplife/main_systems/system_job/job_info/constants/level_titles.dart';
// import 'package:toplife/main_systems/system_job/domain/model/job.dart';
// import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';
// import 'package:toplife/main_systems/system_job/job_info/job_titles.dart';
// import 'package:toplife/main_systems/system_job/util/get_random_corporate_company_suffix.dart';
// import 'package:toplife/main_systems/system_job/util/get_random_tech_company_suffix.dart';
// import 'package:toplife/main_systems/system_job/util/specific_company_suffix.dart';
// import 'package:toplife/main_systems/system_school/degree_info/degree_branch.dart';
// import 'package:toplife/main_systems/system_school/degree_info/degree_discipline.dart';
// import 'package:toplife/main_systems/system_school/domain/model/degree.dart';
// import 'package:toplife/main_systems/system_school/domain/model/info_models/school_pair.dart';
// import 'package:toplife/main_systems/system_school/domain/model/school.dart';