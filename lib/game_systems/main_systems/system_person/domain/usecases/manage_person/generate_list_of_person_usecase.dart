import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/generate_a_person_usecase.dart';

class GenerateListOfPersonUsecase {
  final GenerateAPersonUsecase _generateAPersonUsecase;

  const GenerateListOfPersonUsecase({
    required GenerateAPersonUsecase generateAPersonUsecase,
  }) : _generateAPersonUsecase = generateAPersonUsecase;

  List<Person> execute({
    required int numberOfPerson,
    required int currentGameID,
    required int currentDay,
    required String? lastName,
    required String? parentBirthCountryString,
    required String currentCountry,
    required String currentState,
    required List<LifeStage> possibleLifeStages,
    Gender? gender,
    Sexuality? sexuality,
    bool earlyStageInAge = false,
    bool lateStageInAge = false,
    bool isDead = false,
  }) {
    List<Person> people = [];

    int counter = numberOfPerson;

    while (counter > 0 && counter <= numberOfPerson) {
      people.add(
        _generateAPersonUsecase.execute(
          currentGameID: currentGameID,
          currentDay: currentDay,
          lastName: lastName,
          parentBirthCountryString: parentBirthCountryString,
          currentCountryString: currentCountry,
          currentStateString: currentState,
          gender: gender,
          sexuality: sexuality,
          possibleLifeStages: possibleLifeStages,
          isDead: isDead,
        ),
      );

      counter--;
    }

    return people;
  }
}
