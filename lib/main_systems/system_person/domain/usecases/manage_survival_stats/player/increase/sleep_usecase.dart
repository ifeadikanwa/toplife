import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/core/utils/date_and_time/get_sentence_time.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';
import 'package:toplife/core/utils/default_action_duration/default_action_duration.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/game_manager/action_runner/action_runner.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_detail.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_duration.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_manager/action_runner/info_models/regular_action_usecase.dart';
import 'package:toplife/game_manager/action_runner/info_models/game_action.dart';
import 'package:toplife/game_manager/action_runner/info_models/report.dart';
import 'package:toplife/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/main_systems/system_person/constants/text/sleep_result_dialog_texts.dart';
import 'package:toplife/core/utils/stats/stats_item_builder.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_energy_stats_usecase.dart';

class SleepUsecase implements RegularActionUsecase {
  final ActionRunner _actionRunner;
  final UpdateEnergyStatsUsecase _updateEnergyStatsUsecase;
  final StatsRepository _statsRepository;

  const SleepUsecase(
    this._actionRunner,
    this._updateEnergyStatsUsecase,
    this._statsRepository,
  );

  @override
  ActionDuration get actionDuration =>
      ActionDuration.untimed(durationInMinutes: 0);

  @override
  DefaultActionDuration get defaultActionDuration =>
      const DefaultActionDuration(
        durationInMinutes: DurationTimeInMinutes.oneHour,
        canTakeLonger: true,
      );

  Future<void> perform({
    required int activityDurationInMinutes,
  }) {
    //action detail
    //Executive action because it must run no matter what, event when min stats are low
    final ActionDetail sleepActionDetail = ActionDetail(
      actionDuration: actionDuration,
      gameAction: ExecutiveAction(
        action: (currentGameAndPlayer, dialogHandler) => _execute(
          currentPlayerAndGame: currentGameAndPlayer,
          dialogHandler: dialogHandler,
          activityDurationInMinutes: activityDurationInMinutes,
        ),
      ),
    );

    //return action runner
    return _actionRunner.performNoTravelAction(
      actionDetail: sleepActionDetail,
    );
  }

  //let people pick hours and minutes to sleep for
  Future<ActionResult> _execute({
    required PersonGamePair currentPlayerAndGame,
    required DialogHandler dialogHandler,
    required int activityDurationInMinutes,
  }) async {
    //
    final Person currentPlayer = currentPlayerAndGame.person;

    //
    final Stats? personStats =
        await _statsRepository.getStats(currentPlayer.id);

    //if activity duration is greater than 0 and stats is valid, then sleep
    if (activityDurationInMinutes > 0 && personStats != null) {
      //convert minutes to hours
      final double givenActivityDurationHours =
          activityDurationInMinutes / Time.minutesInAnHour;

      //calculate the gained energy
      final int gainedEnergy =
          (givenActivityDurationHours * StatsConstants.energyGainRatePerHour)
              .floor();

      final int updatedEnergy = gainedEnergy + personStats.energy;

      //if updated energy is less max energy to oversleep, check if the oversleep
      late final bool willOverSleep;
      if (updatedEnergy < StatsConstants.maxEnergyForChanceToOversleep) {
        willOverSleep = Chance.getTrueOrFalseBasedOnPercentageChance(
          trueChancePercentage: StatsConstants.percentageChanceToOversleep,
        );
      }
      //if it is higher than the max they won't oversleep
      else {
        willOverSleep = false;
      }

      //values needed

      //UPDATE ENERGY
      //if the person oversleeps, they sleep till they max out their energy stats
      //so we add the amount needed to get to the max stats
      //if they don't oversleep we add the requested amount
      await _updateEnergyStatsUsecase.execute(
        mainPersonID: currentPlayer.id,
        change: (willOverSleep)
            ? (defaultMaxStatsValue - personStats.energy)
            : gainedEnergy,
        override: false,
      );

      //MINUTES PASSED
      //if the person oversleeps, they sleep till they max out their energy stats
      //so to get the minutes passed for oversleeping:
      //we calculate how much time it would take to reach max stats,
      //this is (statsAmountNeededToReachMax * minutes in an hour)/gainPerHour
      //If they don't oversleep we pass the requested time
      //--put this in action result so that the action runner can move time by the correct amount
      final int minutesPassed = (willOverSleep)
          ? (((defaultMaxStatsValue - personStats.energy) *
                      Time.minutesInAnHour) /
                  StatsConstants.energyGainRatePerHour)
              .round()
          : activityDurationInMinutes;

      //RESULT DESC
      //get title
      final String resultTitle = (willOverSleep)
          ? SleepResultDialogTexts.overSleepTitle
          : SleepResultDialogTexts.normalSleepTitle;

      //get description
      final String firstPersonNormalSleepDesc =
          "I slept for ${getSentenceTime(timeInMinutes: minutesPassed)}.";

      final String firstPersonOverSleepDesc =
          "Whoops! Looks like I overslept.\nThe plan was to sleep for ${getSentenceTime(timeInMinutes: activityDurationInMinutes)} but I slept for ${getSentenceTime(timeInMinutes: minutesPassed)}.";

      final String firstPersonResultDesc = (willOverSleep)
          ? firstPersonOverSleepDesc
          : firstPersonNormalSleepDesc;

      //get updated energy value
      final Stats? updatedStats =
          await _statsRepository.getStats(currentPlayer.id);
      final int newEnergy = (updatedStats != null) ? updatedStats.energy : 0;

      //prep result report
      final Report resultReport = Report(
        dialog: dialogHandler.showResultWithStatsDialog(
          title: resultTitle,
          result: SentenceUtil.convertFromFirstPersonToSecondPerson(
            firstPersonSentence: firstPersonResultDesc,
          ),
          statsList: [
            StatsItemBuilder.defaultStat(
              statsName: TextConstants.energy,
              statsLevel: newEnergy,
            ),
          ],
        ),
      );

      //return success action result
      return ActionResult.successWithReportJournalEntryAndDuration(
        durationInMinutes: minutesPassed,
        journalEntry: firstPersonResultDesc,
        report: resultReport,
      );
    }

    //return fail action result
    return ActionResult.failedWithNoReportOrJournalEntry();
  }
}
