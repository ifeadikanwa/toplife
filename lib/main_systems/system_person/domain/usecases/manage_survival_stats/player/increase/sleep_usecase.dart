import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/result_with_stats_dialog.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/date_and_time/get_sentence_time.dart';
import 'package:toplife/core/utils/date_and_time/time.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/main_systems/system_person/constants/text/sleep_result_dialog_texts.dart';
import 'package:toplife/core/utils/stats/stats_item_builder.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_energy_stats_usecase.dart';

class SleepUsecase {
  final UpdateEnergyStatsUsecase _updateEnergyStatsUsecase;
  final StatsRepository _statsRepository;
  final JournalUsecases _journalUsecases;

  const SleepUsecase(
    this._updateEnergyStatsUsecase,
    this._statsRepository,
    this._journalUsecases,
  );

  //let people pick hours and minutes to sleep for
  Future<void> execute({
    required int personID,
    required int gameID,
    required int currentDay,
    required int activityDurationInMinutes,
    required GameUsecases gameUsecases,
    required BuildContext context,
  }) async {
    final Stats? personStats = await _statsRepository.getStats(personID);

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
        mainPersonID: personID,
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
      final int minutesPassed = (willOverSleep)
          ? (((defaultMaxStatsValue - personStats.energy) *
                      Time.minutesInAnHour) /
                  StatsConstants.energyGainRatePerHour)
              .round()
          : activityDurationInMinutes;
      //move time
      await gameUsecases.moveTimeForwardUsecase.execute(
        gameID: gameID,
        timeInMinutes: minutesPassed,
      );

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
      final Stats? updatedStats = await _statsRepository.getStats(personID);
      final int newEnergy = (updatedStats != null) ? updatedStats.energy : 0;

      //LOG IN JOURNAL
      await _journalUsecases.addToJournalUsecase.execute(
        gameID: gameID,
        day: currentDay,
        mainPlayerID: personID,
        entry: firstPersonResultDesc,
      );

      //RETURN DIALOG
      if (context.mounted) {
        ResultWithStatsDialog.show(
          context: context,
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
        );
      }
    }
  }
}
