import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_age/age.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/usecases/school_usecases.dart';

class AgeUpToTeenActionsUsecase {
  final SchoolUsecases _schoolUsecases;

  const AgeUpToTeenActionsUsecase(this._schoolUsecases);

  //We have specific private functions to handle any subject matter
  //inside that private function, we can now divide into -general -player -npc
  //that means we decide how the subject matter will affect everyone or player and npcs specifically.
  Future<void> execute({
    required int currentDay,
    required Person teenPerson,
    required Age teenAge,
    required bool characterIsCurrentPlayer,
    required int currentPlayerID,
  }) async {
    //start high school
    await _startHighSchool(
      currentDay: currentDay,
      teenPerson: teenPerson,
      teenAge: teenAge,
      characterIsCurrentPlayer: characterIsCurrentPlayer,
      currentPlayerID: currentPlayerID,
    );
  }

  Future<void> _startHighSchool({
    required int currentDay,
    required Person teenPerson,
    required Age teenAge,
    required bool characterIsCurrentPlayer,
    required int currentPlayerID,
  }) async {
    //GENERAL:
    //make the previous college inactive: middle school
    await _schoolUsecases.makePrecollegeInActiveUsecase.execute(
      personID: teenPerson.id,
      precollegeSchoolType: SchoolType.middleSchool,
    );
    //report middle school grade
    await _schoolUsecases.reportPlayerAndNPCPrecollegeGraduationGradeUsecase
        .execute(
      personID: teenPerson.id,
      currentPlayerID: currentPlayerID,
      currentDay: currentDay,
      precollegeSchoolType: SchoolType.middleSchool,
    );

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
        npcPersonID: teenPerson.id,
        currentDay: currentDay,
      );
    }
  }
}
