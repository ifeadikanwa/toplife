import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/data_source_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/data_source/database_constants.dart';
import 'package:toplife/game_manager/data/dao/game_dao_impl.dart';
import 'package:toplife/main_systems/system_person/constants/emotional_state.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class GameManagerScreen extends ConsumerWidget {
  const GameManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              ref.read(gameUsecasesProvider).createGameUsecase.execute(Person(
                    id: DatabaseConstants.dummyId,
                    gameId: DatabaseConstants.dummyId,
                    firstName: "David",
                    lastName: "Smith",
                    dayOfBirth: 21,
                    gender: Gender.Male.name,
                    subjectPronoun: Gender.Male.subjectPronoun,
                    objectPronoun: Gender.Male.objectPronoun,
                    possessivePronoun: Gender.Male.possessivepronoun,
                    sexuality: Sexuality.Straight.name,
                    birthState: "Ontario",
                    birthCountry: "Canada",
                    currentState: "Ontario",
                    currentCountry: "Canada",
                    money: 12000,
                    emotionalState: EmotionalState.normal.name,
                    zodiacSign: ZodiacSign.Libra.name,
                    transportMode: "bus",
                    hasDriversLicense: false,
                    hasFertilityIssues: false,
                    onBirthControl: false,
                    isSterile: false,
                    sickly: false,
                    dead: false,
                  ));
            },
            child: const Text("Create Game")),
        ElevatedButton(
            onPressed: () async {
              // await ref.read(gameManagerViewModel.notifier).getGame(1);

              // ref.read(personUsecasesProvider).makeNonPlayerHungryUsecase.execute(personID: 10);
              // ref
              //     .read(gameUsecasesProvider)
              //     .changeCurrentPlayerUsecase
              //     .execute(gameID: 10, newCurrentPlayerID: 11);

              // final p1 = Partner(
              //   mainPersonID: 1,
              //   partnerID: 7,
              //   partnerRelationshipType: PartnerRelationshipType.engaged.name,
              //   isActive: false,
              //   startDay: 1,
              //   isCoParent: true,
              //   metAt: "metAt",
              //   relationship: 87,
              // );

              // final p2 = Partner(
              //   mainPersonID: 1,
              //   partnerID: 8,
              //   partnerRelationshipType: PartnerRelationshipType.dating.name,
              //   isActive: true,
              //   startDay: 1,
              //   isCoParent: false,
              //   metAt: "metAt",
              //   relationship: 99,
              // );

              // PartnerDaoImpl().createPartner(p1);
              // PartnerDaoImpl().createPartner(p2);

              // const currentDay = 1;

              // final event = Event(
              //   id: 2,
              //   gameID: 1,
              //   eventType: EventType.birthday.name,
              //   eventDay: currentDay,
              //   mainPersonID: 5,
              //   relationshipToMainPlayer: InformalRelationshipType.sibling.name,
              //   journalEntryOnly: true,
              //   performed: false,
              // );

              // final birthdayPerson = await ref
              //     .read(personUsecasesProvider)
              //     .getPersonUsecase
              //     .execute(personID: 5);

              // final age =
              //     ref.read(ageUsecasesProvider).getPersonAgeUsecase.execute(
              //           dayOfBirth: birthdayPerson!.dayOfBirth,
              //           currentDay: currentDay,
              //         );

              // await BirthdayEvent(
              //   ref.read(relationshipUsecasesProvider),
              //   ref.read(personUsecasesProvider),
              //   ref.read(ageUsecasesProvider),
              //   ref.read(journalUsecasesProvider),
              //   EventScheduler(ref.read(eventRepositoryProvider)),
              //   ref.read(eventRepositoryProvider),
              // ).execute(1, event);

              // print(EventManager.convertEventTypeStringToEnum("birthday"));

              // print(result);

              final Game? currentGame =
                  await GameDaoImpl(db).getLastPlayedActiveGame();

              if (currentGame != null) {
                GameDaoImpl(db).updateGame(
                    currentGame.copyWith(currentTimeInMinutes: 720));
              }
            },
            child: const Text("do")),
        ElevatedButton(onPressed: () {}, child: const Text("run")),
        ElevatedButton(
            onPressed: () async {
              // ref.read(gameManagerViewModel.notifier).deleteGame(9);

              // ref.read(personUsecasesProvider).deletePersonUsecase.execute( personID: 12);

              // await GameDaoImpl().deleteGame(2);
            },
            child: const Text("Delete")),
      ],
    );
  }
}
