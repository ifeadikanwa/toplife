import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/core/utils/money/format_money_to_string.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_location/location_manager.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/interactions/util/reciever_comment_generator.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class SendMoneyInteraction extends RelationshipInteraction {
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final PersonUsecases _personUsecases;
  final AgeUsecases _ageUsecases;
  final DialogHandler _dialogHandler;

  SendMoneyInteraction(
    this._relationshipUsecases,
    this._journalUsecases,
    this._personUsecases,
    this._ageUsecases,
    this._dialogHandler,
  );

  @override
  String get title => "Send Money";

  @override
  String get description => "Let money do the talking";

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
    //the player has to at least be a child
    //the relationship person has to at least be a child

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

    return (relationshipPersonIsAtLeastAChild && playerIsAtLeastAChild);
  }

  @override
  Future<void> execute({
    required Game currentGame,
    required Person currentPlayer,
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  }) async {
    //prompt the player for an amount and retrieve it
    final int? chosenMoneyAmount = await _dialogHandler.showSendMoneyDialog(
      personRelationshipPair: personRelationshipPair,
      relationshipLabel: relationshipLabel,
    );

    //if we get a valid amount
    if (chosenMoneyAmount != null && chosenMoneyAmount > 0) {
      //get relationship person
      final Person relationshipPerson = personRelationshipPair.person;
      //get relationship
      final Relationship relationship = personRelationshipPair.relationship;

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

        final bool personIsInterestedInRelationship =
            relationship.interestedInRelationship;

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
          entry: resultDescription.firstPersonSentence,
        );

        //return result dialog
        return _dialogHandler.showResultDialog(
          title: "Money Received",
          result: resultDescription.secondPersonSentence,
        );
      }
      //if player does not have that money
      else {
        //log in journal
        await _journalUsecases.addToJournalUsecase.execute(
          gameID: currentGame.id,
          day: currentGame.currentDay,
          mainPlayerID: currentPlayer.id,
          entry:
              "I tried to send $formattedMoneyString to my $relationshipLabel, ${personRelationshipPair.person.firstName} but I didn't have that much money.",
        );

        //return result
        return _dialogHandler.showResultDialog(
          title: "Nothing To Give",
          result:
              "Your bank called to remind you that you do not have that money to give.",
        );
      }
    }
  }
}
