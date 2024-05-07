import 'dart:math';

import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/utils/chance.dart';
import 'package:toplife/core/utils/numbers/get_random_int_in_positive_range.dart';
import 'package:toplife/core/utils/numbers/remap_value_in_range_to_any_range.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_problem_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/car_quality.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/driving_mode.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_car_quality_enum.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/accident_constants.dart';
import 'package:toplife/game_systems/main_systems/system_transportation/constants/transport_mode.dart';

class CheckAndHandleLandTravelAccidentsUsecase {
  final PersonUsecases _personUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  final JournalUsecases _journalUsecases;
  final DialogHandler _dialogHandler;

  const CheckAndHandleLandTravelAccidentsUsecase(
    this._personUsecases,
    this._shopAndStorageUsecases,
    this._journalUsecases,
    this._dialogHandler,
  );

  Future<bool> execute({
    required int gameID,
    required int currentDay,
    required int currentPLayerID,
    required List<int> npcPassengersPersonIDs,
    required TransportMode currentTransportMode,
    required Car currentTransportation,
    required DrivingMode currentDrivingMode,
  }) async {
    //set accident chance to start with default
    int accidentChance = AccidentConstants.defaultAccidentChance;

    //Public Transport:
    if (currentTransportMode != TransportMode.private) {
      final bool accidentOccured = Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: accidentChance,
      );

      if (accidentOccured) {
        //!Do: Handle accident effect on passengers

        //report to player
        await logAndReportAccident(
          gameID: gameID,
          currentDay: currentDay,
          currentPLayerID: currentPLayerID,
          transportMode: currentTransportMode,
        );

        //return true
        return true;
      }
    }

    //Private Transport:
    else {
      //chack stats and add its effect to accident chance
      final Stats? currentPlayerStat =
          await _personUsecases.getPersonStatsUsecase.execute(
        currentPLayerID,
      );

      if (currentPlayerStat != null) {
        //-Energy stat
        if (currentPlayerStat.energy <=
            AccidentConstants.accidentLowEnergyStatThreshold) {
          //convert the energy stat to accident chance
          const StatsRange energyStatsRange = StatsRange(
            min: AccidentConstants.minimumPossibleStats,
            max: AccidentConstants.accidentLowEnergyStatThreshold,
          );

          const StatsRange energyAccidentChanceRange = StatsRange(
            min: AccidentConstants.minLowEnergyStatAccidentChance,
            max: AccidentConstants.maxLowEnergyStatAccidentChance,
          );

          final int currentEnergyStat = currentPlayerStat.energy;

          final int accidentChanceFromEnergyStat = remapValueInRangeToAnyRange(
            oldStatsRange: energyStatsRange,
            oldValue: currentEnergyStat,
            newStatsRange: energyAccidentChanceRange,
          ).round();

          //add the result to the accidentChance variable
          accidentChance += accidentChanceFromEnergyStat;
        }

        //-Sober stat
        if (currentPlayerStat.sober <=
            AccidentConstants.accidentLowSoberStatThreshold) {
          //convert sober stat to accident chance
          const StatsRange soberStatsRange = StatsRange(
            min: AccidentConstants.minimumPossibleStats,
            max: AccidentConstants.accidentLowSoberStatThreshold,
          );

          const StatsRange soberAccidentChanceRange = StatsRange(
            min: AccidentConstants.minLowSoberStatAccidentChance,
            max: AccidentConstants.maxLowSoberStatAccidentChance,
          );

          final int currentSoberStat = currentPlayerStat.sober;

          final int accidentChanceFromSoberStat = remapValueInRangeToAnyRange(
            oldStatsRange: soberStatsRange,
            oldValue: currentSoberStat,
            newStatsRange: soberAccidentChanceRange,
          ).round();

          //add the result to the accidentChance variable
          accidentChance += accidentChanceFromSoberStat;
        }
      }

      //-Driving mode
      //increase/decrease accident chance by driving mode accident chance effect
      accidentChance +=
          (accidentChance * (currentDrivingMode.accidentChanceEffect / 100))
              .round();

      //Now we have our final accident chance value
      //check if there is an accident

      final bool accidentOccured = Chance.getTrueOrFalseBasedOnPercentageChance(
        trueChancePercentage: accidentChance,
      );

      if (accidentOccured) {
        //!Do: Handle accident effect on passengers

        //Handle accident effect on car
        late final int afterAccidentMaxCondition;
        late final CarQuality afterAccidentCarQuality;
        late final int afterAccidentInsuranceCost;
        late final int afterAccidentPercentageOfTravelTime;

        //- Car Problems
        //-- Randomly add 1-3 car problems to the car
        final int chosenNumberOProblems = Random().nextInt(3) + 1;

        for (var i = 0; i < chosenNumberOProblems; i++) {
          //choose a random problem
          final CarProblemType carProblemType = CarProblemType
              .values[Random().nextInt(CarProblemType.values.length)];
          //add problems to car
          await _shopAndStorageUsecases.createCarProblemUsecase.execute(
            car: currentTransportation,
            currentDay: currentDay,
            carProblemType: carProblemType,
          );
        }

        //-Max condition
        //-- accident chance/2 determines if car is completely destroyed (max condition = 0)
        final bool carIsCompletelyDestroyed =
            Chance.getTrueOrFalseBasedOnPercentageChance(
          trueChancePercentage: (accidentChance ~/ 2),
        );
        //set the max condition to 0 if car is destroyed
        afterAccidentMaxCondition = (carIsCompletelyDestroyed)
            ? 0
            : currentTransportation.maxConditionAtPurchase;

        //-Car quality
        //-- use accident chance to determine if car quality takes a hit
        final bool carQualityIsReduced =
            Chance.getTrueOrFalseBasedOnPercentageChance(
          trueChancePercentage: accidentChance,
        );

        if (carQualityIsReduced) {
          //find out what the current quality is.
          //reduce it to the one below
          final CarQuality? currentCarQuality =
              getCarQualityEnum(currentTransportation.quality);

          //set car quality
          switch (currentCarQuality) {
            case CarQuality.high:
              afterAccidentCarQuality = CarQuality.mid;
              break;
            case CarQuality.mid:
              afterAccidentCarQuality = CarQuality.low;
              break;
            default:
              afterAccidentCarQuality = CarQuality.low;
              break;
          }
        }

        //- Travel time
        //-- use accident chance to determine the percentage to increase the travel time by.
        final int travelTimeIncreasePercentage =
            Random().nextInt(accidentChance);

        final int currentPercentageOfTravelTime =
            currentTransportation.percentageOfTravelTime;
        //set new travel time
        afterAccidentPercentageOfTravelTime = (currentPercentageOfTravelTime +
                (currentPercentageOfTravelTime *
                    (travelTimeIncreasePercentage / 100)))
            .round();

        //- Insurance cost
        //-- increase the insurance cost by a random percentage within the range (1/2 of accident chance -> accident chance)
        final int insuranceCostIncreasePercentage = getRandomIntInPositiveRange(
          min: (accidentChance ~/ 2),
          max: accidentChance,
        );

        final int currentInsuranceCost = currentTransportation.insuranceCost;

        afterAccidentInsuranceCost = (currentInsuranceCost +
                (currentInsuranceCost *
                    (insuranceCostIncreasePercentage / 100)))
            .round();

        //- Update Car
        //-- update car with all the after accident values
        await _shopAndStorageUsecases.updateCarUsecase.execute(
          car: currentTransportation.copyWith(
            maxConditionAtPurchase: afterAccidentMaxCondition,
            percentageOfTravelTime: afterAccidentPercentageOfTravelTime,
            quality: afterAccidentCarQuality.name,
            insuranceCost: afterAccidentInsuranceCost,
          ),
        );

        //!Do: -Insurance Payout

        //report to player
        await logAndReportAccident(
          gameID: gameID,
          currentDay: currentDay,
          currentPLayerID: currentPLayerID,
          transportMode: currentTransportMode,
        );

        //return true
        return true;
      }
    }

    //if you get here there was no accident
    return false;
  }

  //Log accident in journal and report it to the player
  Future<void> logAndReportAccident({
    required int gameID,
    required int currentDay,
    required int currentPLayerID,
    required TransportMode transportMode,
  }) async {
    const String resultTitle = "Boom! Crash!";
    final String firstPersonResultDesc = (transportMode ==
            TransportMode.private)
        ? "I got into an accident while driving."
        : "I got into an accident while riding a ${transportMode.presentationName.toLowerCase()}.";

    //log in journal
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: gameID,
      day: currentDay,
      mainPlayerID: currentPLayerID,
      entry: firstPersonResultDesc,
    );

    //show result dialog to player
    await _dialogHandler.showResultDialog(
      title: resultTitle,
      result: SentenceUtil.convertFromFirstPersonToSecondPerson(
        firstPersonSentence: firstPersonResultDesc,
      ),
    );
  }
}
