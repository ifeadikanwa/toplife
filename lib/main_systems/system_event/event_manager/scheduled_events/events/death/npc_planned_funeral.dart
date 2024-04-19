import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';

class NpcPlannedFuneral {
  final EventSchedulers _eventScheduler;
  final JournalUsecases _journalUsecases;
  final DialogHandler _dialogHandler;

  const NpcPlannedFuneral(
    this._eventScheduler,
    this._journalUsecases,
    this._dialogHandler,
  );

  Future<void> run({
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
    );

    final String firstPersonFuneralArrangement =
        DeathEvent.getFirstPersonFuneralArrangementString(
      funeralDay: scheduledFuneral.eventDay,
      startTime: scheduledFuneral.startTime,
    );

    //log in journal
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: deathEvent.gameId,
      day: deathEvent.eventDay,
      mainPlayerID: mainPlayerID,
      entry: "$firstPersonEventDescription $firstPersonFuneralArrangement",
    );

    //show in dialog
    final String result = "${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonEventDescription,
    )}\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonFuneralArrangement,
    )}";

    return _dialogHandler.showResultDialog(
      title: DeathEvent.resultTitle,
      result: result,
    );
  }
}
