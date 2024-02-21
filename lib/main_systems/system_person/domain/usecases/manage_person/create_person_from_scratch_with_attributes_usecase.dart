
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_person/constants/gender.dart';
import 'package:toplife/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_appearance_pair.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/create_given_person_with_attributes_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_person/generate_a_person_usecase.dart';

class CreatePersonFromScratchWithAttributesUsecase {
  final GenerateAPersonUsecase _generateAPersonUsecase;
  final CreateGivenPersonWithAttributesUsecase
      _createGivenPersonWithAttributesUsecase;

  const CreatePersonFromScratchWithAttributesUsecase(
    this._generateAPersonUsecase,
    this._createGivenPersonWithAttributesUsecase,
  );

  Future<PersonAppearancePair> execute({
    required int currentGameID,
    required int currentDay,
    required String currentCountryString,
    required String currentStateString,
    required List<LifeStage> possibleLifeStages,
    String? lastName,
    Gender? gender,
    Sexuality? sexuality,
    bool earlyStageInAge = false,
    bool lateStageInAge = false,
  }) async {
    //generate a person
    final Person generatedPerson = _generateAPersonUsecase.execute(
      currentGameID: currentGameID,
      currentDay: currentDay,
      lastName: lastName,
      parentBirthCountryString: null,
      currentCountryString: currentCountryString,
      currentStateString: currentStateString,
      possibleLifeStages: possibleLifeStages,
      gender: gender,
      sexuality: sexuality,
      earlyStageInAge: earlyStageInAge,
      lateStageInAge: lateStageInAge,
    );

    //create the person with attributes from scratch
    final PersonAppearancePair createPersonWithAttributes =
        await _createGivenPersonWithAttributesUsecase.execute(
      person: generatedPerson,
      currentDay: currentDay,
      parentAppearancePair: null,
      canGenerateTattoos: true,
      canGeneratePiercings: true,
    );

    return createPersonWithAttributes;
  }
}
