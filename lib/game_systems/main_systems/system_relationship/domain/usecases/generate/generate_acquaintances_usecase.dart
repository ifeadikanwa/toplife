
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/gender.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/sexuality.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/info_models/person_appearance_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/existing_relationship_override_instruction.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/create/create_relationship_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_acquaintance_relationship_from_template.dart';

class GenerateAcquaintancesUsecase {
  final PersonUsecases _personUsecases;
  final CreateRelationshipUsecase _createRelationshipUsecase;

  const GenerateAcquaintancesUsecase(
    this._personUsecases,
    this._createRelationshipUsecase,
  );

  Future<List<Person>> execute({
    required int numberOfPeople,
    required bool allowChanceNotInterestedInRelationship,
    required int currentPlayerID,
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
    //create specified number of people
    final List<PersonAppearancePair> createdPeople = await _personUsecases
        .createPeopleFromScratchWithAttributesUsecase
        .execute(
      numberOfPeople: numberOfPeople,
      currentGameID: currentGameID,
      currentDay: currentDay,
      currentCountryString: currentCountryString,
      currentStateString: currentStateString,
      possibleLifeStages: possibleLifeStages,
      gender: gender,
      sexuality: sexuality,
      earlyStageInAge: earlyStageInAge,
      lateStageInAge: lateStageInAge,
    );

    //create acquaintance relationship for each person
    for (var createdPerson in createdPeople) {
      //decide if they are interested in building a relationship
      late final bool interestedInRelationship;

      //if we are allowed to make them uninterested, run chance
      if (allowChanceNotInterestedInRelationship) {
        //15% chance they are not interested
        interestedInRelationship = Chance.getTrueOrFalseBasedOnPercentageChance(
          trueChancePercentage: 75,
        );
      }
      //if we are not allowed, then they are always interested
      else {
        interestedInRelationship = true;
      }

      //create acquaintance relationship
      final Relationship relationship = getAcquaintanceRelationshipFromTemplate(
        firstPersonID: currentPlayerID,
        secondPersonID: createdPerson.person.id,
        interestedInRelationship: interestedInRelationship,
      );

      await _createRelationshipUsecase.execute(
        relationship: relationship,
        existingRelationshipOverrideInstruction:
            ExistingRelationshipOverrideInstruction.everything,
      );
    }

    //returns a list of acquaintance persons
    return createdPeople.map((e) => e.person).toList();
  }
}
