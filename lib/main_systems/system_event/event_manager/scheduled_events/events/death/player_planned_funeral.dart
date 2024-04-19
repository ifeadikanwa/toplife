import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/date_and_time/get_clock_time.dart';
import 'package:toplife/main_systems/system_event/domain/model/info_models/funeral_event_detail.dart';
import 'package:toplife/main_systems/system_event/event_manager/event_scheduler/event_schedulers.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/events/death/death_event.dart';
import 'package:toplife/main_systems/system_event/event_manager/scheduled_events/util/standard_event_sentences.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_location/countries/country.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';

class PlayerPlannedFuneral {
  final PersonUsecases _personUsecases;
  final EventSchedulers _eventScheduler;
  final JournalUsecases _journalUsecases;
  final DialogHandler _dialogHandler;

  const PlayerPlannedFuneral(
    this._personUsecases,
    this._eventScheduler,
    this._journalUsecases,
    this._dialogHandler,
  );

  Future<void> run({
    required int mainPlayerID,
    required Event deathEvent,
    required String firstPersonEventDescription,
    required Country playerCountry,
  }) async {
    //prompt the player for their funeral plan
    final FuneralEventDetail? funeralEventDetail =
        await _dialogHandler.showPlayerPlannedFuneralDialog(
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

        //log in journal
        final firstPersonJournalDesc =
            "I planned the ${funeralEventDetail.funeralType.name.toLowerCase()} funeral for Day ${scheduledFuneral.eventDay} at ${getClockTime(timeInMinutes: funeralEventDetail.funeralStartTime)} and sent out the invitations.";

        await _journalUsecases.addToJournalUsecase.execute(
          gameID: deathEvent.gameId,
          day: deathEvent.eventDay,
          mainPlayerID: mainPlayerID,
          entry: "$firstPersonEventDescription $firstPersonJournalDesc",
        );

        //show dialog
        final secondPersonResultDesc =
            "The funeral event has been arranged for Day ${scheduledFuneral.eventDay} at ${getClockTime(timeInMinutes: funeralEventDetail.funeralStartTime)} and the invitations have been sent out.";

        return _dialogHandler.showResultDialog(
          title: DeathEvent.resultTitle,
          result: secondPersonResultDesc,
        );
      }
      //player can't afford it
      else {
        const title = StandardEventSentences.notEnoughFundsTitle;
        final desc =
            "You do not have enough money for a ${funeralEventDetail.funeralType.name.toLowerCase()}. You might want to consider a more affordable funeral arrangement.";

        //show a dialog to let the player know
        await _dialogHandler.showResultDialog(
          title: title,
          result: desc,
        );

        //after the player exits the above dialog
        //run the player planned funeral again
        await run(
          mainPlayerID: mainPlayerID,
          deathEvent: deathEvent,
          firstPersonEventDescription: firstPersonEventDescription,
          playerCountry: playerCountry,
        );
      }
    }
  }
}
