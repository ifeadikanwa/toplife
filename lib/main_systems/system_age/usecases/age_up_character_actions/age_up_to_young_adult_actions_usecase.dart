import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/age.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/usecases/school_usecases.dart';

class AgeUpToYoungAdultActionsUsecase {
  final SchoolUsecases _schoolUsecases;

  const AgeUpToYoungAdultActionsUsecase(this._schoolUsecases);

  //We have specific private functions to handle any subject matter
  //inside that private function, we can now divide into -general -player -npc
  //that means we decide how the subject matter will affect everyone or player and npcs specifically.
  Future<void> execute({
    required BuildContext context,
    required int currentDay,
    required Person youngAdultPerson,
    required Age youngAdultAge,
    required bool characterIsCurrentPlayer,
    required int currentPlayerID,
  }) async {
    //end high school
    await _endHighSchool(
      context: context,
      currentDay: currentDay,
      youngAdultPerson: youngAdultPerson,
      youngAdultAge: youngAdultAge,
      characterIsCurrentPlayer: characterIsCurrentPlayer,
      currentPlayerID: currentPlayerID,
    );
  }

  Future<void> _endHighSchool({
    required BuildContext context,
    required int currentDay,
    required Person youngAdultPerson,
    required Age youngAdultAge,
    required bool characterIsCurrentPlayer,
    required int currentPlayerID,
  }) async {
    //make high school inactive
    await _schoolUsecases.makePrecollegeInActiveUsecase.execute(
      personID: youngAdultPerson.id,
      precollegeSchoolType: SchoolType.highSchool,
    );

    //report high school grades
    if (context.mounted) {
      await _schoolUsecases.reportPlayerAndNPCPrecollegeGraduationGradeUsecase
          .execute(
        personID: youngAdultPerson.id,
        currentPlayerID: currentPlayerID,
        currentDay: currentDay,
        precollegeSchoolType: SchoolType.highSchool,
        context: context,
      );
    }
  }
}
