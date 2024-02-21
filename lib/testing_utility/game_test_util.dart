import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/game/game_dependencies_providers.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/constants/emotional_state.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/main_systems/system_person/constants/zodiac_sign.dart';

class GameTestUtil {
  final WidgetRef ref;

  const GameTestUtil({required this.ref});

  Future<void> createGameAndPlayer() async {
    //create game with no player
    final Game game = await ref.watch(gameRepositoryProvider).createGame(
          const Game(
            id: 0,
            currentPlayerID: null,
            isActive: true,
            lastPlayedTime: 0,
            currentDay: 1,
            currentTimeInMinutes: 480,
            generation: 1,
          ),
        );

    //create player
    final Person player = await ref
        .watch(personRepositoriesProvider)
        .personRepositoryImpl
        .createPerson(Person(
          id: 0,
          gameId: game.id,
          firstName: "Ryan",
          lastName: "Howard",
          dayOfBirth: 89,
          gender: Gender.Male.name,
          subjectPronoun: Gender.Male.subjectPronoun,
          objectPronoun: Gender.Male.objectPronoun,
          possessivePronoun: Gender.Male.possessivepronoun,
          sexuality: Sexuality.Straight.name,
          birthState: "Michigan",
          birthCountry: "United States",
          currentState: "Michigan",
          currentCountry: "United States",
          money: 864000,
          emotionalState: EmotionalState.normal.name,
          zodiacSign: ZodiacSign.Libra.name,
          transportMode: "bus",
          drivingMode: "normal",
          hasDriversLicense: false,
          hasFertilityIssues: false,
          onBirthControl: false,
          isSterile: false,
          sickly: false,
          dead: false,
        ));

    //update game with current player
    await ref.watch(gameRepositoryProvider).updateGame(
          game.copyWith(
            currentPlayerID: Value(player.id),
          ),
        );
  }
}
