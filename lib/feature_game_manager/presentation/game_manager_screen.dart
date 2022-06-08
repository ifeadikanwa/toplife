import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/feature_game_manager/presentation/game_states.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

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
                    firstName: "Ify",
                    lastName: "Eze",
                    age: 21,
                    gender: Gender.Female.name,
                    subjectPronoun: Gender.Female.subjectPronoun,
                    objectPronoun: Gender.Female.objectPronoun,
                    sexuality: Sexuallity.Straight.name,
                    state: "state",
                    country: "country",
                    zodiacSign: ZodiacSign.Libra.name,
                    importantStatus: null,
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
                      firstName: "Bello",
                      lastName: "Eze",
                      age: 23,
                      gender: Gender.Male.name,
                      subjectPronoun: Gender.Male.subjectPronoun,
                      objectPronoun: Gender.Male.objectPronoun,
                      sexuality: Sexuallity.Straight.name,
                      state: "state",
                      country: "country",
                      zodiacSign: ZodiacSign.Capricorn.name,
                      importantStatus: null,
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
              ref
                  .read(gameUsecasesProvider)
                  .changeCurrentPlayerUsecase
                  .execute(gameID: 10, newCurrentPlayerID: 11);
            },
            child: const Text("do")),
        ElevatedButton(
            onPressed: () async {
              await ref.read(gameManagerViewModel.notifier).getAllActiveGames();
            },
            child: const Text("getAllActive")),
        ElevatedButton(
            onPressed: () {
              // ref.read(gameManagerViewModel.notifier).deleteGame(9);

              // ref.read(personUsecasesProvider).deletePersonUsecase.execute(3);
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
