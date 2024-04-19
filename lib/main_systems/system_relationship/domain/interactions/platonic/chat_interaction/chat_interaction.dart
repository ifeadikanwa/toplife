import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/core/utils/words/sentence_pair.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/info_models/person_relationship_pair.dart';
import 'package:toplife/main_systems/system_relationship/domain/interactions/platonic/chat_interaction/conversation_generator.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_interaction.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class ChatInteraction extends RelationshipInteraction {
  final RelationshipUsecases _relationshipUsecases;
  final JournalUsecases _journalUsecases;
  final DialogHandler _dialogHandler;

  ChatInteraction(
    this._relationshipUsecases,
    this._journalUsecases,
    this._dialogHandler,
  );

  @override
  String get title => "Chat";

  @override
  String get description => "Have a conversation about any and everything";

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
    //chat is open to every character of every age
    return true;
  }

  @override
  Future<void> execute({
    required Game currentGame,
    required Person currentPlayer,
    required PersonRelationshipPair personRelationshipPair,
    required String relationshipLabel,
  }) async {
    //chat:
    //check if the relationship person is interested in a relationship
    //picks a random topic of conversation
    //increases relationship
    //return a result dialog

    //get relationship person
    final Person relationshipPerson = personRelationshipPair.person;
    //get relationship
    final Relationship relationship = personRelationshipPair.relationship;

    late final int relationshipChange;
    late final String journalEntry;
    late final String resultDesc;

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

      final String firstPersonChatResult =
          ConversationGenerator.getRandomFirstPersonConversation(
        person: relationshipPerson,
        relationshipLabel: relationshipLabel,
      );

      //set entries
      journalEntry = firstPersonChatResult;
      resultDesc = SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: firstPersonChatResult,
      );
    }
    //if the person is not interested
    else {
      //relationship change is always negative
      relationshipChange = -randomNumber;

      //choose a response
      //70% chance it is an uninterested response
      final bool useUninterestedResponse =
          Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: 70,
      );

      if (useUninterestedResponse) {
        //get response
        final SentencePair response =
            ConversationGenerator.getRandomPersonUninterestedResponse(
          person: relationshipPerson,
          relationshipLabel: relationshipLabel,
        );

        //set entries
        journalEntry = response.firstPersonSentence;
        resultDesc = response.secondPersonSentence;
      }
      //use debate response
      else {
        //get response
        final String firstPersonChatResult =
            ConversationGenerator.getRandomFirstPersonDebate(
          person: relationshipPerson,
          relationshipLabel: relationshipLabel,
        );

        //set entries
        journalEntry = firstPersonChatResult;
        resultDesc = SentenceUtil.convertFromFirstPersonToSecondPerson(
          firstPersonSentence: firstPersonChatResult,
        );
      }
    }

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
      entry: journalEntry,
    );

    //return result dialog
    return _dialogHandler.showResultDialog(
      title: title,
      result: resultDesc,
    );
  }
}
