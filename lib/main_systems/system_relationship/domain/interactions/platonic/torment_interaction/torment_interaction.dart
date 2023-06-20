import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/torment_dialog/torment_dialog.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/constants/torment_option.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/torment_interaction/torment_action_generator.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class TormentInteraction extends RelationshipInteraction {
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final PersonUsecases _personUsecases;

  TormentInteraction(
    this._relationshipUsecases,
    this._journalUsecases,
    this._personUsecases,
  );

  @override
  String get title => "Torment";

  @override
  String get description => "Spread a little chaos";

  @override
  int get durationInMinutes => DurationTimeInMinutes.twentyMinutes;

  @override
  bool isAvailable({
    required AgeUsecases ageUsecases,
    required int currentDay,
    required Person currentPlayer,
    required Person relationshipPerson,
    required bool livingTogether,
  }) {
    //RULES:
    //torment is available if
    //player is at least a child
    //relationshipPerson is at least a child

    final bool playerIsAtLeastAChild =
        ageUsecases.checkIfPersonIsAtLeastThisAgeUsecase.execute(
      currentDay: currentDay,
      dayOfBirth: currentPlayer.dayOfBirth,
      age: LifeStage.child,
    );
    final bool relationshipPersonIsAtLeastAChild =
        ageUsecases.checkIfPersonIsAtLeastThisAgeUsecase.execute(
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
    await TormentDialog.show(
      context: context,
      currentGame: currentGame,
      currentPlayer: currentPlayer,
      relationshipPair: relationshipPair,
      relationshipLabel: relationshipLabel,
      informalRelationshipType: informalRelationshipType,
    );
  }

  Future<void> executeTormentOption({
    required BuildContext context,
    required TormentOption chosenTormentOption,
    required Game currentGame,
    required Person currentPlayer,
    required RelationshipPair relationshipPair,
    required String relationshipLabel,
    required InformalRelationshipType informalRelationshipType,
  }) async {
    //get relationship person
    final Person relationshipPerson = relationshipPair.person;

    //*GET TORMENT ACTION
    late final SentencePair tormentAction;

    //get the action description based on the chosen option
    switch (chosenTormentOption) {
      case TormentOption.insult:
        tormentAction = TormentActionGenerator.getInsultAction(
          person: relationshipPerson,
          relationshipLabel: relationshipLabel,
        );
        break;
      case TormentOption.cyberbully:
        tormentAction = TormentActionGenerator.getCyberbullyAction(
          person: relationshipPerson,
          relationshipLabel: relationshipLabel,
        );
        break;
      case TormentOption.spreadRumor:
        tormentAction = TormentActionGenerator.getSpreadRumorAction(
          person: relationshipPerson,
          relationshipLabel: relationshipLabel,
        );
        break;
      case TormentOption.prank:
        tormentAction = TormentActionGenerator.getPrankAction(
          person: relationshipPerson,
          relationshipLabel: relationshipLabel,
        );
        break;
    }

    //*GET RELATIONSHIP CHANGE
    late final int relationshipChange;

    //get a NEGATIVE random number btw 5 - 15
    final int randomNumber = -(Random().nextInt(11) + 5);

    final bool personIsInterestedInRelationship = _relationshipUsecases
        .checkIfPersonIsInterestedInRelationshipUsecase
        .execute(
      relationshipPair: relationshipPair,
    );

    //if person is interested
    if (personIsInterestedInRelationship) {
      //use the random number

      relationshipChange = randomNumber;
    }
    //if the person is not interested
    else {
      //double the random number
      relationshipChange = (randomNumber * 2);
    }

    //*UPDATE EVERYTHING NECESSARY

    //update relationship with change
    await _relationshipUsecases.updateAnyRelationshipAmountUsecase.execute(
      personUsecases: _personUsecases,
      mainPersonID: currentGame.currentPlayerID,
      relationshipPersonID: relationshipPerson.id,
      relationshipToMainPerson: informalRelationshipType.name,
      change: relationshipChange,
    );

    //update journal
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: currentGame.id,
      day: currentGame.currentDay,
      mainPlayerID: currentGame.currentPlayerID,
      entry: tormentAction.firstPersonSentence,
    );

    //return result dialog
    if (context.mounted) {
      return ResultDialog.show(
        context: context,
        title: "Feels Good To Be Bad",
        result: tormentAction.secondPersonSentence,
      );
    }
  }
}
