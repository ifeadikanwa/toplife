import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_manager/action_runner/info_models/report.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/funeral_event_detail.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/standard_event_sentences.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class PlayerPlannedFuneral {
  final PersonUsecases _personUsecases;
  final EventSchedulers _eventScheduler;

  const PlayerPlannedFuneral(
    this._personUsecases,
    this._eventScheduler,
  );

  Future<ActionResult> run({
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required Country playerCountry,
    required DialogHandler dialogHandler,
  }) async {
    //prompt the player for their funeral plan
    final FuneralEventDetail? funeralEventDetail =
        await dialogHandler.showPlayerPlannedFuneralDialog(
      firstPersonEventDescription: firstPersonEventDescription,
      playerCountry: playerCountry,
    );

    //if we get a valid input
    if (funeralEventDetail != null) {
      final playerCanAffordFuneralPlan =
          await _personUsecases.takeMoneyFromPlayerUsecase.execute(
        mainPlayerID: mainPlayerID,
        baseAmountToTake: funeralEventDetail.funeralType.basePrice,
        adjustToEconomy: true,
      );

      if (playerCanAffordFuneralPlan) {
        //receive your choice
        //receive the cost of your choice
        //check that you have enough money to pay for your choice
        //schedule the funeral
        //show a result pop up saying the invitation for the funeral your [relationship], [name]'s has been sent out and the event will happen tomorrow, day [number] at [time chosen].

        final Event scheduledFuneral =
            await _eventScheduler.scheduleFuneral.execute(
          gameID: deathEvent.gameId,
          mainPlayerID: mainPlayerID,
          deadPersonID: deathEvent.mainPersonId,
          currentDay: deathEvent.eventDay,
          eventStartTime: funeralEventDetail.funeralStartTime,
          chosenDaysFromCurrentDayForTheEvent:
              funeralEventDetail.funeralChosenDaysFromCurrentDay,
        );

        //set journal entry
        final firstPersonJournalDesc =
            "I planned the ${funeralEventDetail.funeralType.name.toLowerCase()} funeral for Day ${scheduledFuneral.eventDay} at ${getClockTime(timeInMinutes: funeralEventDetail.funeralStartTime)} and sent out the invitations.";

        final String journalEntry =
            "$firstPersonEventDescription $firstPersonJournalDesc";

        //set report
        final secondPersonResultDesc =
            "The funeral event has been arranged for Day ${scheduledFuneral.eventDay} at ${getClockTime(timeInMinutes: funeralEventDetail.funeralStartTime)} and the invitations have been sent out.";

        final Report resultReport = Report(
          dialog: dialogHandler.showResultDialog(
            title: DeathEvent.resultTitle,
            result: secondPersonResultDesc,
          ),
        );

        //return success result
        return ActionResult.successWithReportJournalEntryButNoDuration(
          report: resultReport,
          journalEntry: journalEntry,
        );
      }
      //player can't afford it
      else {
        const title = StandardEventSentences.notEnoughFundsTitle;
        final desc =
            "You do not have enough money for a ${funeralEventDetail.funeralType.name.toLowerCase()}. You might want to consider a more affordable funeral arrangement.";

        //show a dialog to let the player know
        await dialogHandler.showResultDialog(
          title: title,
          result: desc,
        );

        //after the player exits the above dialog
        //run the player planned funeral again
        return run(
          mainPlayerID: mainPlayerID,
          deathEvent: deathEvent,
          firstPersonEventDescription: firstPersonEventDescription,
          playerCountry: playerCountry,
          dialogHandler: dialogHandler,
        );
      }
    } else {
      //if there is no valid input from the player
      //return failed result
      return ActionResult.failedWithNoReportOrJournalEntry();
    }
  }
}
