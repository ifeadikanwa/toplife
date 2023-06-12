import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_person/constants/text/eat_result_dialog_texts.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/increase/eat/eat_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_servings_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

class QuickEatUsecase {
  final StatsRepository _statsRepository;
  final EatUsecase _eatUsecase;

  const QuickEatUsecase(
    this._statsRepository,
    this._eatUsecase,
  );

  Future<void> execute({
    required int mainPersonID,
    required int gameID,
    required int currentDay,
    required int activityDurationInMinutes,
    required BuildContext context,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required GameUsecases gameUsecases,
  }) async {
    //get food-fridgefood pair
    final List<FridgeFoodPair> fridgeFoodPairs =
        await shopAndStorageUsecases.getAllPersonFridgeFoodPairsUsecase.execute(
      personID: mainPersonID,
    );

    //if the list is empty, there's no food
    if (fridgeFoodPairs.isEmpty) {
      //if context is valid, show dialog
      if (context.mounted) {
        return ResultDialog.show(
          context: context,
          title: EatResultDialogTexts.noFoodTitle,
          result: EatResultDialogTexts.noFoodDesc,
        );
      }
      //if context is not valid, leave silently
      else {
        return;
      }
    }

    //if the list is not empty
    //get the persons stats
    final Stats? personStats = await _statsRepository.getStats(mainPersonID);

    if (personStats != null) {
      int nutritionNeeded = defaultMaxStatsValue - personStats.hunger;

      //sort fridgefoodpairs by expiry day (largest to smallest)
      fridgeFoodPairs.sort(
        (a, b) => b.fridgeFood.expiryDay.compareTo(a.fridgeFood.expiryDay),
      );

      //list of fridge food to eat
      List<FridgeFoodServingPair> foodToEat = [];

      //track current index
      int currentIndex = 0;

      //start adding food to eat
      //while we still have food to choose from AND nutrition to satisfy
      while (currentIndex < fridgeFoodPairs.length && nutritionNeeded > 0) {
        //get current fridge food
        final FridgeFood currentFridgeFood =
            fridgeFoodPairs[currentIndex].fridgeFood;
        //get current food
        final Food currentFood = fridgeFoodPairs[currentIndex].food;

        //track servings to take
        int servingsToTake = 0;

        //while there are servings to take and nutrition to satisfy
        while (servingsToTake < currentFridgeFood.servingsLeft &&
            nutritionNeeded > 0) {
          //take a serving
          servingsToTake++;
          //reduce nutrition needed by the servings nutrition
          nutritionNeeded -= currentFood.nutrition;
        }

        //add to food to eat
        foodToEat.add(
          FridgeFoodServingPair(
            fridgeFood: currentFridgeFood,
            food: currentFood,
            servings: servingsToTake,
          ),
        );

        //increase index
        currentIndex++;
      }

      //after we've decided what to eat
      //call eat usecase
      if (context.mounted) {
        await _eatUsecase.execute(
          mainPersonID: mainPersonID,
          gameID: gameID,
          currentDay: currentDay,
          activityDurationInMinutes: activityDurationInMinutes,
          fridgeFoodServingPairs: foodToEat,
          context: context,
          shopAndStorageUsecases: shopAndStorageUsecases,
          gameUsecases: gameUsecases,
        );
      }
    }
  }
}
