import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/custom_dialogs/relationship/send_money_dialog/send_money_dialog.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/core/utils/money/format_money_to_string.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';
import 'package:toplife/main_systems/system_age/life_stage.dart';
import 'package:toplife/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_location/location_manager.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/util/reciever_comment_generator.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class SendMoneyInteraction extends RelationshipInteraction {
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final PersonUsecases _personUsecases;

  SendMoneyInteraction(
    this._relationshipUsecases,
    this._journalUsecases,
    this._personUsecases,
  );

  @override
  String get title => "Send Money";

  @override
  String get description => "Let money do the talking";

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
    //the player has to at least be a child
    //the relationship person has to at least be a child

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

    return (relationshipPersonIsAtLeastAChild && playerIsAtLeastAChild);
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
    await SendMoneyDialog.show(
      context: context,
      currentGame: currentGame,
      currentPlayer: currentPlayer,
      relationshipPair: relationshipPair,
      relationshipLabel: relationshipLabel,
      informalRelationshipType: informalRelationshipType,
    );
  }

  Future<void> executeSendChosenMoneyAmount({
    required BuildContext context,
    required int chosenMoneyAmount,
    required Game currentGame,
    required Person currentPlayer,
    required RelationshipPair relationshipPair,
    required String relationshipLabel,
    required InformalRelationshipType informalRelationshipType,
  }) async {
    //check if money is amount is valid
    if (chosenMoneyAmount > 0) {
      //get relationship person
      final Person relationshipPerson = relationshipPair.person;

      //get country currency
      final String currency = LocationManager.getCountryCurrency(
        currentPlayer.currentCountry,
      );

      //formatted money string
      final String formattedMoneyString =
          "$currency${formatMoneyToString(chosenMoneyAmount)}";

      //check if player has enough money
      final bool playerHasEnoughMoney =
          await _personUsecases.checkIfPlayerCanAffordItUsecase.execute(
        personID: currentPlayer.id,
        basePrice: chosenMoneyAmount,
        adjustToEconomy: false,
      );

      //if player has enough money
      if (playerHasEnoughMoney) {
        //GET RELATIONSHIP CHANGE
        late final int relationshipChange;
        late final SentencePair resultDescription;

        //get a random number btw 5 - 10
        final int randomNumber = Random().nextInt(6) + 5;

        final bool personIsInterestedInRelationship = _relationshipUsecases
            .checkIfPersonIsInterestedInRelationshipUsecase
            .execute(
          relationshipPair: relationshipPair,
        );

        //if person is interested
        if (personIsInterestedInRelationship) {
          //relationship change is positive
          relationshipChange = randomNumber;

          //get good result description
          resultDescription = RecieverCommentGenerator.getRandomGoodComment(
            person: relationshipPerson,
            relationshipLabel: relationshipLabel,
            sentItem: formattedMoneyString,
          );
        }
        //if the person is not interested
        else {
          //relationship change is always negative
          relationshipChange = -randomNumber;

          //get bad result description
          resultDescription = RecieverCommentGenerator.getRandomBadComment(
            person: relationshipPerson,
            relationshipLabel: relationshipLabel,
            sentItem: formattedMoneyString,
          );
        }

        //UPDATE EVERYTHING NECESSARY

        //remove the money from players account
        await _personUsecases.takeMoneyFromPlayerUsecase.execute(
          mainPlayerID: currentPlayer.id,
          baseAmountToTake: chosenMoneyAmount,
          adjustToEconomy: false,
        );

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
          entry: resultDescription.firstPersonSentence,
        );

        //return result dialog
        if (context.mounted) {
          return ResultDialog.show(
            context: context,
            title: "Money Recieved",
            result: resultDescription.secondPersonSentence,
          );
        }
      }
      //if player does not have that money
      else {
        //log in journal
        await _journalUsecases.addToJournalUsecase.execute(
          gameID: currentGame.id,
          day: currentGame.currentDay,
          mainPlayerID: currentPlayer.id,
          entry:
              "I tried to send $formattedMoneyString to my $relationshipLabel, ${relationshipPair.person.firstName} but I didn't have that much money.",
        );

        //return result
        if (context.mounted) {
          return ResultDialog.show(
            context: context,
            title: "Nothing To Give",
            result:
                "Your bank called to remind you that you do not have that money to give.",
          );
        }
      }
    }
  }
}
