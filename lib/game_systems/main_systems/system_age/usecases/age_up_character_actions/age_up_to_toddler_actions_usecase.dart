import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/school_usecases.dart';

class AgeUpToToddlerActionsUsecase {
  final SchoolUsecases _schoolUsecases;

  const AgeUpToToddlerActionsUsecase(this._schoolUsecases);

  //We have specific private functions to handle any subject matter
  //inside that private function, we can now divide into -general -player -npc
  //that means we decide how the subject matter will affect everyone or player and npcs specifically.
  Future<void> execute({
    required int currentDay,
    required Person toddlerPerson,
    required Age toddlerAge,
    required bool characterIsCurrentPlayer,
    required int currentPlayerID,
  }) async {
    //start elementary school
    await _startElementarySchool(
      currentDay: currentDay,
      toddlerPerson: toddlerPerson,
      toddlerAge: toddlerAge,
      characterIsCurrentPlayer: characterIsCurrentPlayer,
      currentPlayerID: currentPlayerID,
    );
  }

  Future<void> _startElementarySchool({
    required int currentDay,
    required Person toddlerPerson,
    required Age toddlerAge,
    required bool characterIsCurrentPlayer,
    required int currentPlayerID,
  }) async {
    //GENERAL:
    //-

    //PLAYER
    if (characterIsCurrentPlayer) {
      //setup precollege
      await _schoolUsecases.setupPlayerPrecollegeSchoolUsecase.execute(
        currentPlayerID: currentPlayerID,
        currentDay: currentDay,
      );
    }
    //NPC
    else {
      //register npc at precollege
      await _schoolUsecases.registerNPCAtPrecollegeUsecase.execute(
        currentPlayerID: currentPlayerID,
        npcPersonID: toddlerPerson.id,
        currentDay: currentDay,
      );
    }
  }
}
