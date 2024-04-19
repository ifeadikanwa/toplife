import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/age_up_character_actions/age_up_to_adult_actions_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/age_up_character_actions/age_up_to_child_actions_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/age_up_character_actions/age_up_to_elder_actions_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/age_up_character_actions/age_up_to_teen_actions_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/age_up_character_actions/age_up_to_toddler_actions_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/age_up_character_actions/age_up_to_young_adult_actions_usecase.dart';
import 'package:toplife/main_systems/system_age/usecases/get_persons_age_usecase.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class AgeUpCharacterActionsUsecase {
  final PersonUsecases _personUsecases;
  final GetPersonsAgeUsecase _getPersonsAgeUsecase;
  final AgeUpToToddlerActionsUsecase _ageUpToToddlerActionsUsecase;
  final AgeUpToChildActionsUsecase _ageUpToChildActionsUsecase;
  final AgeUpToTeenActionsUsecase _ageUpToTeenActionsUsecase;
  final AgeUpToYoungAdultActionsUsecase _ageUpToYoungAdultActionsUsecase;
  final AgeUpToAdultActionsUsecase _ageUpToAdultActionsUsecase;
  final AgeUpToElderActionsUsecase _ageUpToElderActionsUsecase;

  const AgeUpCharacterActionsUsecase(
    this._personUsecases,
    this._getPersonsAgeUsecase,
    this._ageUpToToddlerActionsUsecase,
    this._ageUpToChildActionsUsecase,
    this._ageUpToTeenActionsUsecase,
    this._ageUpToYoungAdultActionsUsecase,
    this._ageUpToAdultActionsUsecase,
    this._ageUpToElderActionsUsecase,
  );

  Future<void> execute({
    required int characterID,
    required int currentPlayerID,
    required int currentDay,
  }) async {
    //get the person
    final Person? characterPerson =
        await _personUsecases.getPersonUsecase.execute(
      personID: characterID,
    );

    //if we have a valid person
    if (characterPerson != null) {
      //get their age
      final Age characterAge = _getPersonsAgeUsecase.execute(
        currentDay: currentDay,
        dayOfBirth: characterPerson.dayOfBirth,
      );

      //check if character is the current player
      final bool characterIsCurrentPlayer =
          characterPerson.id == currentPlayerID;

      //GENERAL LOGIC:
      //actions that need to be done for every single character no matter the age

      //SPECIFIC LOGIC:
      //age specific actions
      //redirect to the appropriate usecase
      switch (characterAge.lifeStage) {
        case LifeStage.baby:
          //do nothing
          return;
        case LifeStage.toddler:
          return _ageUpToToddlerActionsUsecase.execute(
            currentDay: currentDay,
            toddlerPerson: characterPerson,
            toddlerAge: characterAge,
            characterIsCurrentPlayer: characterIsCurrentPlayer,
            currentPlayerID: currentPlayerID,
          );
        case LifeStage.child:
          return _ageUpToChildActionsUsecase.execute(
            currentDay: currentDay,
            childPerson: characterPerson,
            childAge: characterAge,
            characterIsCurrentPlayer: characterIsCurrentPlayer,
            currentPlayerID: currentPlayerID,
          );
        case LifeStage.teen:
          return _ageUpToTeenActionsUsecase.execute(
            currentDay: currentDay,
            teenPerson: characterPerson,
            teenAge: characterAge,
            characterIsCurrentPlayer: characterIsCurrentPlayer,
            currentPlayerID: currentPlayerID,
          );
        case LifeStage.youngAdult:
          return _ageUpToYoungAdultActionsUsecase.execute(
            currentDay: currentDay,
            youngAdultPerson: characterPerson,
            youngAdultAge: characterAge,
            characterIsCurrentPlayer: characterIsCurrentPlayer,
            currentPlayerID: currentPlayerID,
          );

        case LifeStage.adult:
          return _ageUpToAdultActionsUsecase.execute(
            currentDay: currentDay,
            adultPerson: characterPerson,
            adultAge: characterAge,
            characterIsCurrentPlayer: characterIsCurrentPlayer,
            currentPlayerID: currentPlayerID,
          );
        case LifeStage.elder:
          return _ageUpToElderActionsUsecase.execute(
            currentDay: currentDay,
            elderPerson: characterPerson,
            elderAge: characterAge,
            characterIsCurrentPlayer: characterIsCurrentPlayer,
            currentPlayerID: currentPlayerID,
          );
      }
    }
  }
}
