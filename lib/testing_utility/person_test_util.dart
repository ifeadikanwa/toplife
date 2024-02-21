import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/person/person_dependencies_providers.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';

class PersonTestUtil {
  final WidgetRef ref;

  const PersonTestUtil({required this.ref});

  Future<void> createMultiplePeople({
    required int gameID,
    required int currentDay,
    required int numberOfPeople,
    LifeStage? possibleLifeStage,
  }) async {
    //generate people
    final people =
        ref.watch(personUsecasesProvider).generateListOfPersonUsecase.execute(
              numberOfPerson: numberOfPeople,
              currentGameID: gameID,
              currentDay: 10,
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
          .watch(personRepositoriesProvider)
          .personRepositoryImpl
          .createPerson(person);
    }
  }
}
