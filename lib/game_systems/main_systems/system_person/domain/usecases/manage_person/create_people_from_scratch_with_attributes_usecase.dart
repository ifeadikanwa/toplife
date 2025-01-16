
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/person_appearance_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_person/create_person_from_scratch_with_attributes_usecase.dart';

class CreatePeopleFromScratchWithAttributesUsecase {
  final CreatePersonFromScratchWithAttributesUsecase
      _createPersonFromScratchWithAttributesUsecase;

  const CreatePeopleFromScratchWithAttributesUsecase(
    this._createPersonFromScratchWithAttributesUsecase,
  );

  Future<List<PersonAppearancePair>> execute({
    required int numberOfPeople,
    required int currentGameID,
    required int currentDay,
    required String currentCountryString,
    required String currentStateString,
    required List<LifeStage> possibleLifeStages,
    Gender? gender,
    Sexuality? sexuality,
    bool earlyStageInAge = false,
    bool lateStageInAge = false,
  }) async {
    final List<PersonAppearancePair> peopleWithAttributes = [];

    for (int i = 0; i < numberOfPeople; i++) {
      //create person with attributes and add them to our list
      peopleWithAttributes.add(
        await _createPersonFromScratchWithAttributesUsecase.execute(
          currentGameID: currentGameID,
          currentDay: currentDay,
          currentCountryString: currentCountryString,
          currentStateString: currentStateString,
          possibleLifeStages: possibleLifeStages,
          gender: gender,
          sexuality: sexuality,
          earlyStageInAge: earlyStageInAge,
          lateStageInAge: lateStageInAge,
        ),
      );
    }

    //return the complete list of created people
    return peopleWithAttributes;
  }
}
