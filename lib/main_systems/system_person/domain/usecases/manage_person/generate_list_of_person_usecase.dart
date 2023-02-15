import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_a_person_usecase.dart';

class GenerateListOfPersonUsecase {
  final GenerateAPersonUsecase _generateAPersonUsecase;

  const GenerateListOfPersonUsecase({
    required GenerateAPersonUsecase generateAPersonUsecase,
  }) : _generateAPersonUsecase = generateAPersonUsecase;

  List<Person> execute({
    required int numberOfPerson,
    required int currentGameID,
    required int currentDay,
    String? lastName,
    required String currentCountry,
    required String currentState,
    Gender? gender,
    Sexuality? sexuallity,
     bool earlyStageInAge = false,
    bool lateStageInAge = false,
    bool canBeBaby = false,
    bool canBeToddler = false,
    bool canBeChild = false,
    bool canBeTeen = false,
    bool canBeYoungAdult = false,
    bool canBeAdult = false,
    bool canBeElder = false,
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
          currentCountry: currentCountry,
          currentState: currentState,
          gender: gender,
          sexuallity: sexuallity,
          canBeBaby: canBeBaby,
          canBeToddler: canBeToddler,
          canBeChild: canBeChild,
          canBeTeen: canBeTeen,
          canBeYoungAdult: canBeYoungAdult,
          canBeAdult: canBeAdult,
          canBeElder: canBeElder,
          isDead: isDead,
        ),
      );

      counter--;
    }

    return people;
  }
}
