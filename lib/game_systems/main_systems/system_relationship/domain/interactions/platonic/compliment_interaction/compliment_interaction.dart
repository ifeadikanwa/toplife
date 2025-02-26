import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/interactions/platonic/compliment_interaction/compliment_generator.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class ComplimentInteraction extends RelationshipInteraction {
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final DialogHandler _dialogHandler;

  ComplimentInteraction(
    this._relationshipUsecases,
    this._journalUsecases,
    this._dialogHandler,
  );

  @override
  String get title => "Compliment";

  @override
  String get description => "Say something nice";

  @override
  int get durationInMinutes => DurationTimeInMinutes.tenMinutes;

  @override
  bool isAvailable({
    required int currentDay,
    required Person currentPlayer,
    required Person relationshipPerson,
    required bool livingTogether,
  }) {
    //RULES:
    //compliment is open to every character of every age
    return true;
  }

  @override
  Future<void> execute({
    required Game currentGame,
    required Person currentPlayer,
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  }) async {
    //compliment:
    //check if the relationship person is interested in a relationship
    //picks a random compliment
    //changes relationship
    //updates journal
    //return a result dialog

    //get relationship person
    final Person relationshipPerson = personRelationshipPair.person;
    //get relationship
    final Relationship relationship = personRelationshipPair.relationship;

    //GET RELATIONSHIP CHANGE
    late final int relationshipChange;

    //get a random number btw 1 - 10
    final int randomNumber = Random().nextInt(10) + 1;

    final bool personIsInterestedInRelationship =
        relationship.interestedInRelationship;

    //if person is interested
    if (personIsInterestedInRelationship) {
      //30% chance the change is negative
      final bool changeIsNegative =
          Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 30,
      );

      relationshipChange = (changeIsNegative) ? -randomNumber : randomNumber;
    }
    //if the person is not interested
    else {
      //relationship change is always negative
      relationshipChange = -randomNumber;
    }

    //GET COMPLIMENT
    final SentencePair complimentResult =
        ComplimentGenerator.getRandomCompliment(
      person: relationshipPerson,
      relationshipLabel: relationshipLabel,
    );

    //UPDATE EVERYTHING NECESSARY
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
      entry: complimentResult.firstPersonSentence,
    );

    //return result dialog
    return _dialogHandler.showResultDialog(
      title: title,
      result: complimentResult.secondPersonSentence,
    );
  }
}
