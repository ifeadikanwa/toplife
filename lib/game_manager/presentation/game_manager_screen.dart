import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/game_manager/presentation/game_states.dart';
import 'package:toplife/main_systems/system_event/data/dao/event_dao_impl.dart';
import 'package:toplife/main_systems/system_event/domain/model/event.dart';
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

              const event = Event(
                id: 6,
                gameID: 1,
                eventType: "eventType6",
                eventDay: 8,
                mainPersonID: 3,
                relationshipToMainPlayer: "sibling",
                journalEntryOnly: false,
                performed: true,
              );

              EventDaoImpl().updateEvent(event);
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
