import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_item.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/main_systems/system_person/constants/text/eat_result_dialog_texts.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/increase/eat/eat_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_servings_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

class QuickEatUsecase {
  final StatsRepository _statsRepository;
  final EatUsecase _eatUsecase;
  final DialogHandler _dialogHandler;
  final ShopAndStorageUsecases _shopAndStorageUsecases;

  const QuickEatUsecase(
    this._statsRepository,
    this._eatUsecase,
    this._dialogHandler,
    this._shopAndStorageUsecases,
  );

  Future<void> execute({
    required int mainPersonID,
    required int gameID,
    required int currentDay,
    required int activityDurationInMinutes,
  }) async {
    //get food-fridgefood pair
    final List<FridgeFoodPair> fridgeFoodPairs = await _shopAndStorageUsecases
        .getAllPersonFridgeFoodPairsUsecase
        .execute(
      personID: mainPersonID,
    );

    //if the list is empty, there's no food
    if (fridgeFoodPairs.isEmpty) {
      return _dialogHandler.showResultDialog(
        title: EatResultDialogTexts.noFoodTitle,
        result: EatResultDialogTexts.noFoodDesc,
      );
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
      //if there is nothing selected -> there is no food needed
      if (foodToEat.isEmpty) {
        //tell the player they are not hungry
        return _dialogHandler.showResultWithStatsDialog(
          title: "Satisfied!",
          result: "You're not hungry",
          statsList: [
            const StatsItem(
              statsName: TextConstants.hunger,
              statsLevel: defaultMaxStatsValue,
              statsRange: StatsRangeConstants.defaultRange,
              positiveIsAlwaysGreen: false,
            ),
          ],
        );
      }
      //food to eat has been chosen
      else {
        //call eat usecase
        await _eatUsecase.execute(
          mainPersonID: mainPersonID,
          gameID: gameID,
          currentDay: currentDay,
          activityDurationInMinutes: activityDurationInMinutes,
          fridgeFoodServingPairs: foodToEat,
        );
      }
    }
  }
}
