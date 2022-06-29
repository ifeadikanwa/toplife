import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_relationship/data/dao/parent_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/dao/degree_dao_impl.dart';
import 'package:toplife/main_systems/system_school/data/repository/degree_repository_impl.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/create_and_populate_degree_table_usecase.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/get_constant_list_of_degrees_usecase.dart';

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

              // final myParent = Parent(mainPersonID: 1, parentID: 2, parentRelationshipType: ParentRelationshipType.step.name, relationship: 80, isActive: false,);
              //
              // ParentDaoImpl().createParent(myParent);

              // final parentInfo = await ParentDaoImpl().getAllActiveParents(1);
              // print(parentInfo);

              // Person? person = await PersonDaoImpl().getPerson(4);

              // if (person != null) {
              //   Age age = ref.read(ageUsecasesProvider).getPersonAgeUsecase.execute(
              //         dayOfBirth: person.dayOfBirth,
              //         currentDay: 1,
              //       );
              //   print("Age: ${age.lifeStage.stageName} ${age.pointInStage}/${age.lifeStage.stageDuration}");
              // }

              // DegreeDaoImpl().createDegree(Degree(discipline: "discipline2", branch: "branch2", isSpecialDegree: false));

              CreateAndPopulateDegreeTableUsecase(
                      degreeRepository:
                          DegreeRepositoryImpl(degreeDao: DegreeDaoImpl()),
                      getConstantListOfDegreesUsecase:
                          GetConstantListOfDegreesUsecase())
                  .execute();
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
