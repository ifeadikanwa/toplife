import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';
import 'package:toplife/game_systems/main_systems/system_age/life_stage.dart';
import 'package:toplife/game_systems/main_systems/system_age/usecases/age_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/interactions/util/reciever_comment_generator.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

class SendFoodInteraction extends RelationshipInteraction {
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final AgeUsecases _ageUsecases;
  final DialogHandler _dialogHandler;

  SendFoodInteraction(
    this._relationshipUsecases,
    this._journalUsecases,
    this._shopAndStorageUsecases,
    this._ageUsecases,
    this._dialogHandler,
  );

  @override
  String get title => "Send Food";

  @override
  String get description => "If it's edible, it's food";

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
    //the player and relationship person must NOT be living together

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
    return ((!livingTogether) &&
        relationshipPersonIsAtLeastAChild &&
        playerIsAtLeastAChild);
  }

  @override
  Future<void> execute({
    required Game currentGame,
    required Person currentPlayer,
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  }) async {
    //get players fridgefood
    final List<FridgeFoodPair> fridgeFoodPairs = await _shopAndStorageUsecases
        .getAllPersonFridgeFoodPairsUsecase
        .execute(
      personID: currentPlayer.id,
    );

    if (fridgeFoodPairs.isEmpty) {
      //log attempt in journal
      await _journalUsecases.addToJournalUsecase.execute(
        gameID: currentGame.id,
        day: currentGame.currentDay,
        mainPlayerID: currentPlayer.id,
        entry:
            "I tried to send food to my $relationshipLabel, ${personRelationshipPair.person.firstName} but I didn't have any food.",
      );

      //return result
      await _dialogHandler.showResultDialog(
        title: "Nothing To Give",
        result:
            "You have no food to send. Maybe you should be begging for food?",
      );
    }
    //SEND FOOD
    else {
      //return the send food dialog
      //get the chosen food option from the player
      final FridgeFoodPair? chosenFoodOption =
          await _dialogHandler.showSendFoodDialog(
        fridgeFoodPairs: fridgeFoodPairs,
        personRelationshipPair: personRelationshipPair,
        relationshipLabel: relationshipLabel,
      );

      //If a valid food is chosen
      if (chosenFoodOption != null) {
        //get food
        final String foodName = chosenFoodOption.food.name;

        //get relationship person
        final Person relationshipPerson = personRelationshipPair.person;
        //get relationship
        final Relationship relationship = personRelationshipPair.relationship;

        //GET RELATIONSHIP CHANGE
        late final int relationshipChange;
        late final SentencePair resultDescription;

        //get a random number btw 5 - 10
        final int randomNumber = Random().nextInt(6) + 5;

        final bool personIsInterestedInRelationship =
            relationship.interestedInRelationship;

        //if food is expired
        if (chosenFoodOption.fridgeFood.expiryDay < currentGame.currentDay) {
          //relationship change is  negative
          relationshipChange = -randomNumber;

          //get spoiled food result description
          resultDescription =
              RecieverCommentGenerator.getRandomSpoiledFoodComment(
            person: relationshipPerson,
            relationshipLabel: relationshipLabel,
            sentItem: "spoiled $foodName",
          );
        }
        //if person is interested
        else if (personIsInterestedInRelationship) {
          //relationship change is positive
          relationshipChange = randomNumber;

          //get good result description
          resultDescription = RecieverCommentGenerator.getRandomGoodComment(
            person: relationshipPerson,
            relationshipLabel: relationshipLabel,
            sentItem: foodName,
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
            sentItem: foodName,
          );
        }

        //UPDATE EVERYTHING NECESSARY

        //remove the chosen food from storage
        await _shopAndStorageUsecases.useFoodUsecase.execute(
          fridgeFoodID: chosenFoodOption.fridgeFood.id,
        );

        //update relationship with change
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
          title: "Food Received",
          result: resultDescription.secondPersonSentence,
        );
      }
    }
  }
}
