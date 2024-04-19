import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/constants/torment_option.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/torment_interaction/torment_action_generator.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class TormentInteraction extends RelationshipInteraction {
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final AgeUsecases _ageUsecases;
  final DialogHandler _dialogHandler;

  TormentInteraction(
    this._relationshipUsecases,
    this._journalUsecases,
    this._ageUsecases,
    this._dialogHandler,
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
    required bool livingTogether,
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
    required Game currentGame,
    required Person currentPlayer,
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  }) async {
    //prompt the player for a torment option

    final TormentOption? chosenTormentOption =
        await _dialogHandler.showTormentDialog(
      personRelationshipPair: personRelationshipPair,
      relationshipLabel: relationshipLabel,
    );

    //if we have a valid torment option
    if (chosenTormentOption != null) {
      //get relationship person
      final Person relationshipPerson = personRelationshipPair.person;
      //get relationship
      final Relationship relationship = personRelationshipPair.relationship;

      //*GET TORMENT ACTION:
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

      //*GET RELATIONSHIP CHANGE:
      late final int relationshipChange;

      //get a NEGATIVE random number btw 5 - 15
      final int randomNumber = -(Random().nextInt(11) + 5);

      final bool personIsInterestedInRelationship =
          relationship.interestedInRelationship;

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

      //update relationship level
      await _relationshipUsecases.updateRelationshipLevelUsecase.execute(
        firstPersonID: relationship.firstPersonId,
        secondPersonID: relationship.secondPersonId,
        change: relationshipChange,
      );

      //update journal
      await _journalUsecases.addToJournalUsecase.execute(
        gameID: currentGame.id,
        day: currentGame.currentDay,
        mainPlayerID: currentPlayer.id,
        entry: tormentAction.firstPersonSentence,
      );

      //return result dialog
      return _dialogHandler.showResultDialog(
        title: "Feels Good To Be Bad",
        result: tormentAction.secondPersonSentence,
      );
    }
  }
}
