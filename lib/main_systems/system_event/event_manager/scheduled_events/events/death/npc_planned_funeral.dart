//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';

class NpcPlannedFuneral {
  final EventSchedulers _eventScheduler;
  final JournalUsecases _journalUsecases;

  const NpcPlannedFuneral(
    this._eventScheduler,
    this._journalUsecases,
  );

  Future<void> run({
    required BuildContext context,
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
  }) async {
    final Event scheduledFuneral =
        await _eventScheduler.scheduleFuneral.execute(
      gameID: deathEvent.gameId,
      mainPlayerID: mainPlayerID,
      deadPersonID: deathEvent.mainPersonId,
      currentDay: deathEvent.eventDay,
      relationshipToMainPlayer: deathEvent.relationshipToMainPlayer,
    );

    final String firstPersonFuneralArrangement =
        "I am invited to their funeral event tomorrow, Day ${scheduledFuneral.eventDay} at ${getClockTime(timeInMinutes: scheduledFuneral.startTime ?? 0)}.";

    //log in journal
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: deathEvent.gameId,
      day: deathEvent.eventDay,
      mainPlayerID: mainPlayerID,
      entry: "$firstPersonEventDescription $firstPersonEventDescription",
    );

    //show in dialog
    final String result = "${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonEventDescription,
    )}\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonFuneralArrangement,
    )}";

    ResultDialog.show(
      context: context,
      title: DeathEvent.resultTitle,
      result: result,
    );
  }
}
