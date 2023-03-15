//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/choice_dialog.dart';
import 'package:toplife/core/dialogs/custom_dialogs/death_event_dialogs/player_planned_funeral/player_planned_funeral_dialog.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/main_systems/system_event/constants/funeral_type.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/event_choice.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/standard_event_sentences.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';

class PlayerPlannedFuneral {
  final PersonUsecases _personUsecases;
  final EventScheduler _eventScheduler;
  final JournalUsecases _journalUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const PlayerPlannedFuneral(
    this._personUsecases,
    this._eventScheduler,
    this._journalUsecases,
    this._relationshipUsecases,
  );

  Future<void> run({
    required BuildContext context,
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required Country playerCountry,
  }) async {
    PlayerPlannedFuneralDialog.show(
      context: context,
      mainPlayerID: mainPlayerID,
      deathEvent: deathEvent,
      firstPersonEventDescription: firstPersonEventDescription,
      playerCountry: playerCountry,
      planFuneral: planFuneral,
    );
  }

  Future<void> planFuneral({
    required BuildContext context,
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required Country playerCountry,
    required FuneralType funeralType,
    required int cost,
    required int eventStartTime,
  }) async {
    //recieve your choice
    //recieve the cost of your choice
    //check that you have enough money to pay for your choice

    final playerCanAffordFuneralPlan =
        await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      relationshipUsecases: _relationshipUsecases,
      mainPlayerID: mainPlayerID,
      baseAmountToTake: cost * playerCountry.economy,
      adjustToEconomy: false,
    );

    if (playerCanAffordFuneralPlan) {
      //schedule the funeral
      //show a result pop up saying the invitation for the funeral your [relationship], [name]'s has been sent out and the event will happen tomorrow, day [number] at [time chosen].

      final Event scheduledFuneral = await _eventScheduler.scheduleFuneral(
        gameID: deathEvent.gameId,
        mainPlayerID: mainPlayerID,
        deadPersonID: deathEvent.mainPersonId,
        currentDay: deathEvent.eventDay,
        eventStartTime: eventStartTime,
        relationshipToMainPlayer: deathEvent.relationshipToMainPlayer,
      );

      //log in journal
      final firstPersonJournalDesc =
          "I planned the ${funeralType.name.toLowerCase()} funeral for tomorrow at ${getClockTime(timeInMinutes: eventStartTime)} and sent out the invitations.";

      _journalUsecases.addToJournalUsecase.execute(
          gameID: deathEvent.gameId,
          day: deathEvent.eventDay,
          mainPlayerID: mainPlayerID,
          entry: "$firstPersonEventDescription $firstPersonJournalDesc");

      //show dialog
      final secondPersonResultDesc =
          "The funeral event has been arranged for tomorrow, Day ${scheduledFuneral.eventDay} at ${getClockTime(timeInMinutes: eventStartTime)} and the invitations have been sent out.";

      ResultDialog.show(
        context: context,
        title: DeathEvent.resultTitle,
        result: secondPersonResultDesc,
      );
    }
    //player can't afford it
    else {
      const title = StandardEventSentences.notEnoughFundsTitle;
      final desc =
          "You do not have enough money for a ${funeralType.name.toLowerCase()}. You might want to consider a more affordable funeral arrangement.";

      final EventChoice reshowPlayerPlannedFuneralDialogChoice = EventChoice(
        choiceDescription: StandardEventSentences.ok,
        choiceAction: (BuildContext context) {
          run(
            context: context,
            mainPlayerID: mainPlayerID,
            deathEvent: deathEvent,
            firstPersonEventDescription: firstPersonEventDescription,
            playerCountry: playerCountry,
          );
        },
      );

      ChoiceDialog.show(
        context: context,
        categoryTitle: title,
        eventDescription: desc,
        choices: [
          reshowPlayerPlannedFuneralDialogChoice,
        ],
      );
    }
  }
}
