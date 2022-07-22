import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_dao_impl.dart';

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



              // final result = ju.getAValidListOfFullTimeJobsUsecase.execute([
              //   Degree(
              //       discipline: "law",
              //       branch: "Criminal Law",
              //       isSpecialDegree: true)
              // ]);

              // print(result);

           
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
