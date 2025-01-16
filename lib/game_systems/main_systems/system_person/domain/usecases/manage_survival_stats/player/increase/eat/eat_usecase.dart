import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/action_result.dart';
import 'package:toplife/game_systems/game_manager/action_runner/info_models/report.dart';
import 'package:toplife/game_systems/game_manager/domain/model/info_models/person_game_pair.dart';
import 'package:toplife/game_systems/main_systems/system_person/constants/text/eat_result_dialog_texts.dart';
import 'package:toplife/core/utils/stats/stats_item_builder.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/update_specific_stats/update_hunger_stats_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_servings_pair.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_servings_label.dart';

class EatUsecase {
  final StatsRepository _statsRepository;
  final UpdateHungerStatsUsecase _updateHungerStatsUsecase;
  final ShopAndStorageUsecases _shopAndStorageUsecases;

  const EatUsecase(
    this._statsRepository,
    this._updateHungerStatsUsecase,
    this._shopAndStorageUsecases,
  );

  Future<ActionResult> execute({
    required PersonGamePair currentPlayerAndGame,
    required DialogHandler dialogHandler,
    required List<FridgeFoodServingPair> fridgeFoodServingPairs,
  }) async {
    //
    final Person currentPlayer = currentPlayerAndGame.person;
    final Game currentGame = currentPlayerAndGame.game;

    //if the fridge food list is not empty
    if (fridgeFoodServingPairs.isNotEmpty) {
      //take food out of the fridge
      for (var fridgeFoodServingPair in fridgeFoodServingPairs) {
        await _shopAndStorageUsecases.useFoodUsecase.execute(
          fridgeFoodID: fridgeFoodServingPair.fridgeFood.id,
          servingsToUse: fridgeFoodServingPair.servings,
        );
      }

      //nutrition to add
      int nutrition = 0;
      StringBuffer firstPersonResultStringBuffer = StringBuffer(
        EatResultDialogTexts.iAte,
      );

      //get nutrition and build result string
      for (var i = 0; i < fridgeFoodServingPairs.length; i++) {
        final Food currentFood = fridgeFoodServingPairs[i].food;
        final int currentServings = fridgeFoodServingPairs[i].servings;
        final FridgeFood currentFridgeFood =
            fridgeFoodServingPairs[i].fridgeFood;

        //add to nutrition
        nutrition += (currentFood.nutrition * currentServings);

        //add to result sentence
        //if it is not the first add a comma to sentence
        if (i != 0) {
          firstPersonResultStringBuffer.write(",");
        }
        //if it is the list length is greater than 1 AND this is the last food in the list also add "and"
        if (fridgeFoodServingPairs.length > 1 &&
            i == fridgeFoodServingPairs.length - 1) {
          firstPersonResultStringBuffer.write(" and");
        }

        //if food is expired prepare to add spoiled to sentence
        final String spoiledOrNotText =
            (currentFridgeFood.expiryDay < currentGame.currentDay)
                ? "${EatResultDialogTexts.spoiled} "
                : "";

        //add the food to the sentence
        //1 serving of spoiled Milk
        //2 servings of Chicken Stir-fry
        firstPersonResultStringBuffer.write(
            " ${getServingsLabel(servings: currentServings)} of $spoiledOrNotText${currentFood.name}");
      }

      //update hunger
      await _updateHungerStatsUsecase.execute(
        mainPersonID: currentPlayer.id,
        change: nutrition,
        override: false,
      );

      //get updated hunger value
      final Stats? updatedStats =
          await _statsRepository.getStats(currentPlayer.id);
      final int newHunger = (updatedStats != null) ? updatedStats.hunger : 0;

      //prep result dialog
      final Report resultReport = Report(
        dialog: dialogHandler.showResultWithStatsDialog(
          title: EatResultDialogTexts.eatenTitle,
          result: SentenceUtil.convertFromFirstPersonToSecondPerson(
            firstPersonSentence: firstPersonResultStringBuffer.toString(),
          ),
          statsList: [
            StatsItemBuilder.defaultStat(
              statsName: TextConstants.hunger,
              statsLevel: newHunger,
            ),
          ],
        ),
      );

      //return success action result
      return ActionResult.successWithReportJournalEntryButNoDuration(
        report: resultReport,
        journalEntry: firstPersonResultStringBuffer.toString(),
      );
    }

    //if there is no fridge food, return failed action result
    return ActionResult.failedWithNoReportOrJournalEntry();
  }
}
