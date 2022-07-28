import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
// import 'package:toplife/main_systems/system_job/data/dao/employment_dao_impl.dart';
// import 'package:toplife/main_systems/system_job/data/dao/job_dao_impl.dart';
// import 'package:toplife/main_systems/system_job/data/dao/job_relationship_dao_impl.dart';
// import 'package:toplife/main_systems/system_job/data/repository/job_repositories.dart';
// import 'package:toplife/main_systems/system_job/domain/model/job.dart';
// import 'package:toplife/main_systems/system_job/domain/usecases/job_usecases.dart';
// import 'package:toplife/main_systems/system_job/job_info/constants/employment_type.dart';
// import 'package:toplife/main_systems/system_job/job_info/constants/health_insurance_coverage.dart';
// import 'package:toplife/main_systems/system_job/job_info/constants/job_type.dart';
// import 'package:toplife/main_systems/system_job/job_info/constants/level_titles.dart';
// import 'package:toplife/main_systems/system_job/job_info/game_job_pay.dart';
// import 'package:toplife/main_systems/system_job/job_info/job_titles.dart';
// import 'package:toplife/main_systems/system_job/util/specific_company_suffix.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
// import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
// import 'package:toplife/main_systems/system_school/data/dao/degree_dao_impl.dart';
// import 'package:toplife/main_systems/system_school/data/dao/school_dao_impl.dart';
// import 'package:toplife/main_systems/system_school/data/dao/school_project_dao_impl.dart';
// import 'package:toplife/main_systems/system_school/data/dao/school_relationship_dao_impl.dart';
// import 'package:toplife/main_systems/system_school/data/repository/school_repositories.dart';
// import 'package:toplife/main_systems/system_school/domain/usecases/school_usecases.dart';

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

              // final Degree degree = Degree(
              //   discipline: DegreeDiscipline.education.name,
              //   branch: "English",
              //   isSpecialDegree: true,
              // );

              // final schoolrepo = SchoolRepositories(
              //   degreeDao: DegreeDaoImpl(),
              //   schoolDao: SchoolDaoImpl(),
              //   schoolProjectDao: SchoolProjectDaoImpl(),
              //   schoolRelationshipDao: SchoolRelationshipDaoImpl(),
              // );
              // final schoolUsecases =
              //     SchoolUsecases(schoolRepositories: schoolrepo);

              // // final school = await schoolrepo.schoolRepositoryImpl.getSchool(2);
              // // final graduate =
              // //     await schoolUsecases.graduateUsecase.execute(school: school!);

              // // print(graduate);

              // final result = await schoolUsecases.applyToTeacherEducationProgramUsecase
              //     .execute(mainPersonID: 1, degree: degree, gameEconomy: 1);

              // // final admission = await schoolUsecases
              // //     .admitIntoMedicalSchoolUsecase
              // //     .execute(1, result, 24);

              // print(result);
              // // print(admission);

              // final list = await schoolUsecases
              //     .getValidListOfBachelorDegreesUsecase
              //     .execute(personID: 1);

              // print(list);

              // final job = Job(
              //   jobTitle: JobTitles.surgeon,
              //   jobType: JobType.medical.name,
              //   companySuffix: getRandomMedicalCompanySuffix(),
              //   employmentType: EmploymentType.fullTime.name,
              //   levelOneTitle: LevelTitle.intern.titleName,
              //   levelOneBasePay: GameJobPay.medical.minLevelOneBasePay +
              //       (0.20 * GameJobPay.medical.minLevelOneBasePay).ceil(),
              //   levelTwoTitle: LevelTitle.chiefResident.titleName,
              //   levelTwoBasePay: GameJobPay.medical.minLevelTwoBasePay +
              //       (0.20 * GameJobPay.medical.minLevelTwoBasePay).ceil(),
              //   levelThreeTitle: LevelTitle.medicalDirector.titleName,
              //   levelThreeBasePay: GameJobPay.medical.minLevelThreeBasePay +
              //       (0.20 * GameJobPay.medical.minLevelThreeBasePay).ceil(),
              //   qualifiedDisciplines: [DegreeDiscipline.medical].toString(),
              //   qualifiedBranches: [DegreeBranch.surgery].toString(),
              //   healthInsuranceCoverage:
              //       HealthInsuranceCoverage.high.percentage,
              // );
              //
              // final job = Job(
              //   jobTitle: JobTitles.exoticDancer,
              //   jobType: JobType.sexWork.name,
              //   companySuffix: SpecificCompanySuffix.club,
              //   employmentType: EmploymentType.fullTime.name,
              //   levelOneTitle: LevelTitle.trainee.titleName,
              //   levelOneBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
              //       (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay)
              //           .ceil(),
              //   levelTwoTitle: LevelTitle.backup.titleName,
              //   levelTwoBasePay: GameJobPay.generalFullTime.minLevelOneBasePay +
              //       (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay)
              //           .ceil(),
              //   levelThreeTitle: LevelTitle.lead.titleName,
              //   levelThreeBasePay:
              //       GameJobPay.generalFullTime.minLevelOneBasePay +
              //           (0.20 * GameJobPay.generalFullTime.minLevelOneBasePay)
              //               .ceil(),
              //   qualifiedDisciplines: [].toString(),
              //   qualifiedBranches: [].toString(),
              //   healthInsuranceCoverage:
              //       HealthInsuranceCoverage.none.percentage,
              // );
              //
              // final result = await JobUsecases(
              //   jobRepositories: JobRepositories(
              //       jobDao: JobDaoImpl(),
              //       jobRelationshipDao: JobRelationshipDaoImpl(),
              //       employmentDao: EmploymentDaoImpl()),
              //   schoolUsecases: SchoolUsecases(
              //     schoolRepositories: SchoolRepositories(
              //         degreeDao: DegreeDaoImpl(),
              //         schoolDao: SchoolDaoImpl(),
              //         schoolProjectDao: SchoolProjectDaoImpl(),
              //         schoolRelationshipDao: SchoolRelationshipDaoImpl()),
              //   ),
              //   personUsecases: ref.read(personUsecasesProvider),
              // )
              //     .checkIfQualifiedForFullTimeJobUsecase
              //     .execute(job: job, personID: 1);
              //
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

              // await GameDaoImpl().deleteGame(2);
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
