import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_manager/action_runner/info_models/report.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';

class NpcPlannedFuneral {
  final EventSchedulers _eventScheduler;

  const NpcPlannedFuneral(
    this._eventScheduler,
  );

  Future<ActionResult> run({
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required DialogHandler dialogHandler,
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

    //set journal entry
    final String journalEntry =
        "$firstPersonEventDescription $firstPersonFuneralArrangement";

    //set report
    final String resultDesc =
        "${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonEventDescription,
    )}\n${SentenceUtil.convertFromFirstPersonToSecondPerson(
      firstPersonSentence: firstPersonFuneralArrangement,
    )}";

    final Report resultReport = Report(
      dialog: dialogHandler.showResultDialog(
        title: DeathEvent.resultTitle,
        result: resultDesc,
      ),
    );

    //return success result
    return ActionResult.successWithReportJournalEntryButNoDuration(
      report: resultReport,
      journalEntry: journalEntry,
    );
  }
}
