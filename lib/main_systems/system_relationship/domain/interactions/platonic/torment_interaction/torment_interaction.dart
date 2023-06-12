import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class TormentInteraction extends RelationshipInteraction {
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;

  TormentInteraction(
    this._relationshipUsecases,
    this._journalUsecases,
    this._personUsecases,
    this._ageUsecases,
  );

  @override
  String get title => "Torment";

  @override
  String get description => "Spread a little chaos";

  @override
  int get durationInMinutes => DurationTimeInMinutes.twentyMinutes;

  @override
  bool isAvailable({
    required int currentDay,
    required Person currentPlayer,
    required Person relationshipPerson,
  }) {
    //RULES:
    //torment is available if
    //player is at least a child
    //relationshipPerson is at least a child

    final bool playerIsAtLeastAChild =
        _ageUsecases.checkIfPersonIsAtLeastThisAgeUsecase.execute(
      currentDay: currentDay,
      dayOfBirth: currentPlayer.dayOfBirth,
      age: LifeStage.child,
    );
    final bool relationshipPersonIsAtLeastAChild =
        _ageUsecases.checkIfPersonIsAtLeastThisAgeUsecase.execute(
      currentDay: currentDay,
      dayOfBirth: relationshipPerson.dayOfBirth,
      age: LifeStage.child,
    );
    return (playerIsAtLeastAChild && relationshipPersonIsAtLeastAChild);
  }

  @override
  Future<void> execute({
    required BuildContext context,
    required Game currentGame,
    required Person currentPlayer,
    required RelationshipPair relationshipPair,
    required String relationshipLabel,
    required InformalRelationshipType informalRelationshipType,
  }) async {
    await _relationshipUsecases.updateAnyRelationshipAmountUsecase.execute(
      personUsecases: _personUsecases,
      mainPersonID: currentGame.currentPlayerID,
      relationshipPersonID: relationshipPair.person.id,
      relationshipToMainPerson: informalRelationshipType.name,
      change: -20,
    );
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: currentGame.id,
      day: currentGame.currentDay,
      mainPlayerID: currentPlayer.id,
      entry: "I tormented ${relationshipPair.person.firstName}",
    );
  }

  Future<void> executeInsult() async {}
}
