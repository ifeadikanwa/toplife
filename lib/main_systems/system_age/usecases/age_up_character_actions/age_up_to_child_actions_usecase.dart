import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/school_usecases.dart';

class AgeUpToChildActionsUsecase {
  final SchoolUsecases _schoolUsecases;

  const AgeUpToChildActionsUsecase(this._schoolUsecases);

  //We have specific private functions to handle any subject matter
  //inside that private function, we can now divide into -general -player -npc
  //that means we decide how the subject matter will affect everyone or player and npcs specifically.
  Future<void> execute({
    required int currentDay,
    required Person childPerson,
    required Age childAge,
    required bool characterIsCurrentPlayer,
    required int currentPlayerID,
  }) async {
    //start middle school
    await _startMiddleSchool(
      currentDay: currentDay,
      childPerson: childPerson,
      childAge: childAge,
      characterIsCurrentPlayer: characterIsCurrentPlayer,
      currentPlayerID: currentPlayerID,
    );
  }

  Future<void> _startMiddleSchool({
    required int currentDay,
    required Person childPerson,
    required Age childAge,
    required bool characterIsCurrentPlayer,
    required int currentPlayerID,
  }) async {
    //GENERAL:
    //make the previous college inactive: elementary school
    await _schoolUsecases.makePrecollegeInActiveUsecase.execute(
      personID: childPerson.id,
      precollegeSchoolType: SchoolType.elementarySchool,
    );
    //report elementary school grade
    await _schoolUsecases.reportPlayerAndNPCPrecollegeGraduationGradeUsecase
        .execute(
      personID: childPerson.id,
      currentPlayerID: currentPlayerID,
      currentDay: currentDay,
      precollegeSchoolType: SchoolType.elementarySchool,
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
        npcPersonID: childPerson.id,
        currentDay: currentDay,
      );
    }
  }
}
