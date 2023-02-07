import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

class GameManagerScreen extends ConsumerWidget {
  const GameManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentGame = ref.watch(currentGameProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              ref.read(gameUsecasesProvider).createGameUsecase.execute(Person(
                    firstName: "David",
                    lastName: "Smith",
                    dayOfBirth: 21,
                    gender: Gender.Male.name,
                    subjectPronoun: Gender.Male.subjectPronoun,
                    objectPronoun: Gender.Male.objectPronoun,
                    possessivePronoun: Gender.Male.possessivepronoun,
                    sexuality: Sexuality.Straight.name,
                    state: "Ontario",
                    country: "Canada",
                    money: 12000,
                    zodiacSign: ZodiacSign.Libra.name,
                    transportMode: "bus",
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
                      firstName: "Stella",
                      lastName: "Baker",
                      dayOfBirth: -23,
                      gender: Gender.Female.name,
                      subjectPronoun: Gender.Female.subjectPronoun,
                      objectPronoun: Gender.Female.objectPronoun,
                      possessivePronoun: Gender.Female.possessivepronoun,
                      sexuality: Sexuality.Straight.name,
                      state: "state",
                      country: "country",
                      money: 3000,
                      zodiacSign: ZodiacSign.Capricorn.name,
                      importantStatus: null,
                      transportMode: "bus",
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
        Text(
          "$currentGame",
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
