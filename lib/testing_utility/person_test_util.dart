import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';

class PersonTestUtil {
  final WidgetRef ref;

  const PersonTestUtil({required this.ref});

  Person generateARandomPerson(int gameId, int currentDay) =>
      ref.read(personUsecasesProvider).generateAPersonUsecase.execute(
        currentGameID: gameId,
        currentDay: currentDay,
        lastName: null,
        parentBirthCountryString: null,
        currentCountryString: "Canada",
        currentStateString: "Quebec",
        possibleLifeStages: [],
      );

  Future<void> createMultiplePeople({
    required int gameID,
    required int currentDay,
    required int numberOfPeople,
    LifeStage? possibleLifeStage,
  }) async {
    //generate people
    final people =
        ref.read(personUsecasesProvider).generateListOfPersonUsecase.execute(
              numberOfPerson: numberOfPeople,
              currentGameID: gameID,
              currentDay: currentDay,
              lastName: null,
              parentBirthCountryString: null,
              currentCountry: "Canada",
              currentState: "Toronto",
              possibleLifeStages: possibleLifeStage != null
                  ? [possibleLifeStage]
                  : LifeStage.values,
            );

    for (var person in people) {
      await ref
          .read(personRepositoriesProvider)
          .personRepositoryImpl
          .createPerson(person);
    }
  }
}
