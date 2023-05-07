//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/core/dialogs/custom_dialogs/death_event_dialogs/family_planned_funeral/family_planned_funeral_dialog.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_descriptions.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_relationship/util/get_relative_relationship_label.dart';
import 'package:toplife/main_systems/system_relationship/util/get_sibling_relationship_label.dart';

class FamilyPlannedFuneral {
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;
  final EventScheduler _eventScheduler;
  final JournalUsecases _journalUsecases;

  const FamilyPlannedFuneral(
    this._personUsecases,
    this._relationshipUsecases,
    this._eventScheduler,
    this._journalUsecases,
  );

  Future<void> run({
    required BuildContext context,
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required Person deadPerson,
    required Country playerCountry,
  }) async {
    final bool isBurial = Chance.getTrueOrFalse();

    final FuneralType chosenFuneralType =
        isBurial ? FuneralType.Burial : FuneralType.Cremation;

    late final int contribution;

    //btw 20 - 70
    final int percentageOfCost = Random().nextInt(50) + 20;

    if (chosenFuneralType == FuneralType.Burial) {
      contribution = playerCountry.economy *
          (FuneralType.Burial.basePrice * (percentageOfCost / 100)).ceil();
    } else {
      contribution = playerCountry.economy *
          (FuneralType.Cremation.basePrice * (percentageOfCost / 100)).ceil();
    }

    final String firstPersonFuneralArrangementsDescription =
        "The family decided to hold a ${chosenFuneralType.name.toLowerCase()} funeral, because ${DeathDescriptions.getRandomFuneralArrangementReason(deadPerson.gender)}.";

    final List<EventChoice> familyPlannedFuneralChoices = [
      EventChoice(
        choiceDescription: "Pay contribution",
        choiceAction: (BuildContext context) async {
          agreeToContributeToFuneral(
            context: context,
            mainPlayerID: mainPlayerID,
            deathEvent: deathEvent,
            firstPersonEventDescription:
                SentenceUtil.convertFromFirstPersonToSecondPerson(
              firstPersonSentence: firstPersonEventDescription,
            ),
            firstPersonFuneralArrangementsDescription:
                firstPersonFuneralArrangementsDescription,
            deadPerson: deadPerson,
            playerCountry: playerCountry,
            contribution: contribution,
            chosenFuneralType: chosenFuneralType,
          );
        },
      ),
      EventChoice(
        choiceDescription: "Refuse to contribute",
        choiceAction: (BuildContext context) async {
          refuseToContributeToFuneral(
            context: context,
            mainPlayerID: mainPlayerID,
            deathEvent: deathEvent,
            firstPersonEventDescription:
                SentenceUtil.convertFromFirstPersonToSecondPerson(
              firstPersonSentence: firstPersonEventDescription,
            ),
            firstPersonFuneralArrangementsDescription:
                firstPersonFuneralArrangementsDescription,
            deadPerson: deadPerson,
            playerCountry: playerCountry,
            contribution: contribution,
            chosenFuneralType: chosenFuneralType,
          );
        },
      ),
    ];

    FamilyPlannedFuneralDialog.show(
      context: context,
      mainPlayerID: mainPlayerID,
      deathEvent: deathEvent,
      eventDescription: SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: firstPersonEventDescription,
      ),
      funeralArrangementsDescription: firstPersonFuneralArrangementsDescription,
      playerContribution: contribution,
      playerCurrency: playerCountry.currency,
      choices: familyPlannedFuneralChoices,
    );
  }

  Future<void> agreeToContributeToFuneral({
    required BuildContext context,
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required String firstPersonFuneralArrangementsDescription,
    required Person deadPerson,
    required Country playerCountry,
    required int contribution,
    required FuneralType chosenFuneralType,
  }) async {
    //check if they can afford it
    //if they can, in result dialog:
    //- positive response
    //else
    //- 50/50 chance of positive or negative response

    final bool playerCanAffordToContribute =
        await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      relationshipUsecases: _relationshipUsecases,
      mainPlayerID: mainPlayerID,
      baseAmountToTake: contribution,
      adjustToEconomy: false,
    );

    late final String resultActionDesc;
    late final String journalActionDesc;
    late final String comment;

    if (playerCanAffordToContribute) {
      resultActionDesc = "Your contribution has been recieved.";
      journalActionDesc =
          "I contributed ${playerCountry.currency}$contribution.";
      comment = DeathDescriptions.getRandomContributionPositiveComment(
        deadPerson.gender,
      );
    } else {
      resultActionDesc = "You do not have enough funds.";
      journalActionDesc =
          "I wanted to contribute ${playerCountry.currency}$contribution but I didn't have enough money.";
      comment = DeathDescriptions.getRandomContributionNoFundsComment(
        deadPerson.gender,
      );
    }

    //schedule funeral
    final Event scheduledFuneral = await _eventScheduler.scheduleFuneral(
      gameID: deathEvent.gameId,
      mainPlayerID: mainPlayerID,
      deadPersonID: deathEvent.mainPersonId,
      currentDay: deathEvent.eventDay,
      relationshipToMainPlayer: deathEvent.relationshipToMainPlayer,
    );

    final String firstPersonResultDesc =
        "I am invited to the funeral event tomorrow, Day ${scheduledFuneral.eventDay} at ${getClockTime(timeInMinutes: scheduledFuneral.startTime ?? 0)}.";

    //Log info in journal
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: deathEvent.gameId,
      day: deathEvent.eventDay,
      mainPlayerID: mainPlayerID,
      entry:
          "$firstPersonEventDescription $firstPersonFuneralArrangementsDescription $journalActionDesc $firstPersonResultDesc",
    );

    //show dialog
    final String result =
        "$resultActionDesc\n$comment.\n${SentenceUtil.convertFromFirstPersonToSecondPerson(firstPersonSentence: firstPersonResultDesc)}";

    ResultDialog.show(
      context: context,
      title: DeathEvent.resultTitle,
      result: result,
    );
  }

  Future<void> refuseToContributeToFuneral({
    required BuildContext context,
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required String firstPersonFuneralArrangementsDescription,
    required Person deadPerson,
    required Country playerCountry,
    required int contribution,
    required FuneralType chosenFuneralType,
  }) async {
    //get siblings:
    //reduce relationship with all of them
    //pick 1 sibling and say they gave the negative response
    //if no siblings, get a random pibling and reduce relationship and say they gave the negative response
    //result dialog with negative response
    //
    late final String resultComment;

    const int relationshipReduction = 20;

    //get comment from siblings
    final List<Sibling> playerSiblings =
        await _relationshipUsecases.getSiblingsUsecase.execute(
      mainPlayerID,
    );

    if (playerSiblings.isNotEmpty) {
      //reduce relationship with siblings
      for (var sibling in playerSiblings) {
        final int oldRelationship = sibling.relationship;
        await _relationshipUsecases.updateSiblingRelationshipUsecase.execute(
          sibling.copyWith(
            relationship: oldRelationship - relationshipReduction,
          ),
        );
      }

      final Sibling chosenSibling = playerSiblings[Random().nextInt(
        playerSiblings.length,
      )];

      final Person? siblingPerson = await _personUsecases.getPersonUsecase
          .execute(personID: chosenSibling.siblingId);

      if (siblingPerson != null) {
        resultComment = "Your ${getSiblingRelationshipLabel(
          chosenSibling.siblingRelationshipType,
          siblingPerson.gender,
        ).toLowerCase()}, ${siblingPerson.firstName}, ${DeathDescriptions.getRandomContributionNegativeComment()}";
      }
    }
    //get comment from a pibling
    else {
      final List<Relative> piblings =
          await _relationshipUsecases.getPiblingsUsecase.execute(
        mainPlayerID,
      );

      if (piblings.isNotEmpty) {
        final Relative chosenPibling =
            piblings[Random().nextInt(piblings.length)];

        //reduce relationship
        final int oldRelationship = chosenPibling.relationship;

        await _relationshipUsecases.updateRelativeRelationshipUsecase.execute(
          chosenPibling.copyWith(
            relationship: oldRelationship - relationshipReduction,
          ),
        );

        final Person? piblingPerson =
            await _personUsecases.getPersonUsecase.execute(
          personID: chosenPibling.relativeId,
        );

        if (piblingPerson != null) {
          resultComment = "Your ${getRelativeRelationshipLabel(
            chosenPibling.relativeRelationshipType,
            piblingPerson.gender,
          ).toLowerCase()}, ${piblingPerson.firstName}, ${DeathDescriptions.getRandomContributionNegativeComment()}";
        } else {
          resultComment = "";
        }
      }
    }

    //schedule funeral
    final Event scheduledFuneral = await _eventScheduler.scheduleFuneral(
      gameID: deathEvent.gameId,
      mainPlayerID: mainPlayerID,
      deadPersonID: deathEvent.mainPersonId,
      currentDay: deathEvent.eventDay,
      relationshipToMainPlayer: deathEvent.relationshipToMainPlayer,
    );

    final String firstPersonResultDesc =
        "I am invited to the funeral event tomorrow, Day ${scheduledFuneral.eventDay} at ${getClockTime(timeInMinutes: scheduledFuneral.startTime ?? 0)}.";

    //Log info in journal
    const journalActionDesc = "I refused to contribute.";
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: deathEvent.gameId,
      day: deathEvent.eventDay,
      mainPlayerID: mainPlayerID,
      entry:
          "$firstPersonEventDescription $firstPersonFuneralArrangementsDescription $journalActionDesc $firstPersonResultDesc",
    );

    //show dialog
    final String result =
        "$resultComment.\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonResultDesc,
    )}";
    ResultDialog.show(
      context: context,
      title: DeathEvent.resultTitle,
      result: result,
    );
  }
}
