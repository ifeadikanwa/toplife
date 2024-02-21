import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_age/age.dart';

class AgeUpToElderActionsUsecase {
  const AgeUpToElderActionsUsecase();

  //We have specific private functions to handle any subject matter
  //inside that private function, we can now divide into -general -player -npc
  //that means we decide how the subject matter will affect everyone or player and npcs specifically.
  Future<void> execute({
    required BuildContext context,
    required int currentDay,
    required Person elderPerson,
    required Age elderAge,
    required bool characterIsCurrentPlayer,
    required int currentPlayerID,
  }) async {}
}
