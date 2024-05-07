import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/date_and_time/duration_time_in_minutes.dart';
import 'package:toplife/core/utils/default_action_duration/default_action_duration.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_item.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/game_manager/action_runner/action_runner.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_detail.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_duration.dart';
import 'package:toplife/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_manager/action_runner/info_models/regular_action_usecase.dart';
import 'package:toplife/game_manager/action_runner/info_models/game_action.dart';
import 'package:toplife/game_manager/action_runner/info_models/report.dart';
import 'package:toplife/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/main_systems/system_person/constants/text/eat_result_dialog_texts.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/increase/eat/eat_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_servings_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';

class QuickEatUsecase implements RegularActionUsecase {
  final ActionRunner _actionRunner;
  final StatsRepository _statsRepository;
  final EatUsecase _eatUsecase;
  final ShopAndStorageUsecases _shopAndStorageUsecases;

  const QuickEatUsecase(
    this._actionRunner,
    this._statsRepository,
    this._eatUsecase,
    this._shopAndStorageUsecases,
  );

  @override
  ActionDuration get actionDuration => ActionDuration.untimed(
        durationInMinutes: defaultActionDuration.durationInMinutes,
      );

  @override
  DefaultActionDuration get defaultActionDuration =>
      const DefaultActionDuration(
        durationInMinutes: DurationTimeInMinutes.thirtyMinutes,
      );

  Future<void> perform() {
    //action detail
    //Executive action because it must run no matter what, event when stats are low
    final ActionDetail quickEatActionDetail = ActionDetail(
      actionDuration: actionDuration,
      gameAction: ExecutiveAction(
        action: (currentGameAndPlayer, dialogHandler) => _execute(
          currentPlayerAndGame: currentGameAndPlayer,
          dialogHandler: dialogHandler,
        ),
      ),
    );

    //return action runner
    return _actionRunner.performNoTravelAction(
      actionDetail: quickEatActionDetail,
    );
  }

  Future<ActionResult> _execute({
    required PersonGamePair currentPlayerAndGame,
    required DialogHandler dialogHandler,
  }) async {
    //
    final Person currentPlayer = currentPlayerAndGame.person;

    //get food-fridgefood pair
    final List<FridgeFoodPair> fridgeFoodPairs = await _shopAndStorageUsecases
        .getAllPersonFridgeFoodPairsUsecase
        .execute(
      personID: currentPlayer.id,
    );

    //get the persons stats
    final Stats? personStats =
        await _statsRepository.getStats(currentPlayer.id);

    //if the list is not empty and person stats is valid
    if (fridgeFoodPairs.isNotEmpty && personStats != null) {
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
        final Report failedReport = Report(
          dialog: dialogHandler.showResultWithStatsDialog(
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
          ),
        );

        //return failed result
        return ActionResult.failedWithReport(report: failedReport);
      }
      //food to eat has been chosen
      else {
        //call eat usecase
        return _eatUsecase.execute(
          currentPlayerAndGame: currentPlayerAndGame,
          dialogHandler: dialogHandler,
          fridgeFoodServingPairs: foodToEat,
        );
      }
    }

    //if the list is empty, there's no food
    //show special message
    else if (fridgeFoodPairs.isEmpty) {
      //show dialog
      final Report failedReport = Report(
        dialog: dialogHandler.showResultDialog(
          title: EatResultDialogTexts.noFoodTitle,
          result: EatResultDialogTexts.noFoodDesc,
        ),
      );

      return ActionResult.failedWithReport(report: failedReport);
    }

    //if we get here no successful action result has been returned, so
    //return failed action result
    return ActionResult.failedWithNoReportOrJournalEntry();
  }
}
