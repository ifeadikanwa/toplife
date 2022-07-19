import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_systems/system_job/data/dao/employment_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/dao/job_relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_job/data/repository/job_repositories.dart';
import 'package:toplife/main_systems/system_job/domain/model/employment.dart';
import 'package:toplife/main_systems/system_job/domain/model/info_models/job_interview_response.dart';
import 'package:toplife/main_systems/system_job/domain/model/job.dart';
import 'package:toplife/main_systems/system_job/domain/model/job_relationship.dart';
import 'package:toplife/main_systems/system_job/domain/usecases/job_usecases.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
import 'package:toplife/main_systems/system_job/job_info/constants/level_titles.dart';
import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';
import 'package:toplife/main_systems/system_job/job_info/game_jobs.dart';
import 'package:toplife/main_systems/system_job/job_info/job_titles.dart';
import 'package:toplife/main_systems/system_job/util/get_random_company_name.dart';
import 'package:toplife/main_systems/system_job/util/get_random_corporate_company_suffix.dart';
import 'package:toplife/main_systems/system_job/util/get_random_tech_company_suffix.dart';
import 'package:toplife/main_systems/system_job/util/specific_company_suffix.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_dao_impl.dart';
import 'package:toplife/main_systems/system_school/constants/degree_level.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/data/dao/degree_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_project_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/school_relationship_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_branch.dart';
import 'package:toplife/main_systems/system_school/degree_info/degree_disciplines.dart';
import 'package:toplife/main_systems/system_school/domain/model/degree.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_completed_degrees_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_highest_attained_degree_level_for_a_completed_degree_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/school_usecases.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentGame = ref.watch(currentGameProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              ref.read(gameManagerViewModel.notifier).createGame(Person(
                    firstName: "David",
                    lastName: "Smith",
                    dayOfBirth: 21,
                    gender: Gender.Male.name,
                    subjectPronoun: Gender.Male.subjectPronoun,
                    objectPronoun: Gender.Male.objectPronoun,
                    sexuality: Sexuality.Straight.name,
                    state: "Ontario",
                    country: "Canada",
                    zodiacSign: ZodiacSign.Libra.name,
                    hasFertilityIssues: false,
                    onBirthControl: false,
                    isSterile: false,
                    sickly: false,
                    rebellious: true,
                    dead: false,
                  ));
            },
            child: const Text("Create Game")),
        ElevatedButton(
            onPressed: () {
              ref.read(personUsecasesProvider).createChildPersonUsecase.execute(
                    person: Person(
                      firstName: "Chinwe",
                      lastName: "Eze",
                      dayOfBirth: 23,
                      gender: Gender.Male.name,
                      subjectPronoun: Gender.Male.subjectPronoun,
                      objectPronoun: Gender.Male.objectPronoun,
                      sexuality: Sexuality.Straight.name,
                      state: "state",
                      country: "country",
                      zodiacSign: ZodiacSign.Capricorn.name,
                      importantStatus: null,
                      hasFertilityIssues: false,
                      onBirthControl: false,
                      isSterile: false,
                      sickly: false,
                      rebellious: true,
                      dead: false,
                    ),
                  );
            },
            child: const Text("create person")),
        ElevatedButton(
            onPressed: () async {
              // await ref.read(gameManagerViewModel.notifier).getGame(1);

              // ref.read(personUsecasesProvider).makeNonPlayerHungryUsecase.execute(personID: 10);
              // ref
              //     .read(gameUsecasesProvider)
              //     .changeCurrentPlayerUsecase
              //     .execute(gameID: 10, newCurrentPlayerID: 11);

              final ju = JobUsecases(
                  jobRepositories: JobRepositories(
                      jobDao: JobDaoImpl(),
                      jobRelationshipDao: JobRelationshipDaoImpl(),
                      employmentDao: EmploymentDaoImpl()),
                  schoolUsecases: SchoolUsecases(
                    schoolRepositories: SchoolRepositories(
                        degreeDao: DegreeDaoImpl(),
                        schoolDao: SchoolDaoImpl(),
                        schoolProjectDao: SchoolProjectDaoImpl(),
                        schoolRelationshipDao: SchoolRelationshipDaoImpl()),
                  ));

              final job = Job(
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
                qualifiedDisciplines:
                    [DegreeDisciplines.engineering].toString(),
                qualifiedBranches: [DegreeBranch.computerScience].toString(),
                healthInsuranceCoverage:
                    HealthInsuranceCoverage.high.percentage,
              );

              // final result = ju.getAValidListOfFullTimeJobsUsecase.execute([
              //   Degree(
              //       discipline: "law",
              //       branch: "Criminal Law",
              //       isSpecialDegree: true)
              // ]);

              // print(result);

              final list = GameJobs.getTenRandomDegreeJobs();
              print(list);

              // const degree = Degree(
              //   discipline: "engineering",
              //   branch: "Computer Science",
              //   isSpecialDegree: false,
              // );

              // await DegreeDaoImpl().createDegree(degree);

              // final result =
              //     await DegreeDaoImpl().findDegreeWithDegreeDisciplineAndBranch(
              //   "medical",
              //   "Surgery",
              // );
              // print(result);

              final school = School(
                mainPersonID: 1,
                grades: 67,
                attendance: 90,
                project: 60,
                exam: 100,
                classStartTime: 1,
                classEndTime: 5,
                totalSemesterNumber: 9,
                currentSemesterNumber: 4,
                schoolType: SchoolType.graduateSchool.name,
                semesterStartDay: 3,
                degreeID: 4,
                degreeLevel: DegreeLevel.master.name,
                isActive: false,
                isCompleted: true,
                wasExpelled: false,
                country: "Canada",
              );

              // await SchoolDaoImpl().createSchool(school);

              // final result = await SchoolDaoImpl().getAllCompletedSchoolForADegree(1, 4);
              // print(result);

              // final result = await GetCompletedDegreesUsecase(
              //   schoolRepositories: SchoolRepositories(
              //       degreeDao: DegreeDaoImpl(),
              //       schoolDao: SchoolDaoImpl(),
              //       schoolProjectDao: SchoolProjectDaoImpl(),
              //       schoolRelationshipDao: SchoolRelationshipDaoImpl()),
              // ).execute(personID: 1);

              // final result = await GetHighestAttainedDegreeLevelForACompletedDegreeUsecase(
              //   schoolRepositories: SchoolRepositories(
              //       degreeDao: DegreeDaoImpl(),
              //       schoolDao: SchoolDaoImpl(),
              //       schoolProjectDao: SchoolProjectDaoImpl(),
              //       schoolRelationshipDao: SchoolRelationshipDaoImpl()),
              // ).execute(1, 4);

              // print(result);
            },
            child: const Text("do")),
        ElevatedButton(
            onPressed: () async {
              await ref.read(gameManagerViewModel.notifier).getAllActiveGames();
            },
            child: const Text("getAllActive")),
        ElevatedButton(
            onPressed: () async {
              // ref.read(gameManagerViewModel.notifier).deleteGame(9);

              // ref.read(personUsecasesProvider).deletePersonUsecase.execute( personID: 12);

              await ParentDaoImpl().deleteParent(1, 2);
            },
            child: const Text("Delete")),
        Text(
          "$currentGame",
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
