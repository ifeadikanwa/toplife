import 'package:flutter/material.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/dialogs/result_with_stats_dialog.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/core/utils/words/sentence_util.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/constants/text/eat_result_dialog_texts.dart';
import 'package:toplife/core/utils/stats/stats_item_builder.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/update_specific_stats/update_hunger_stats_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/info_models/fridge_food_servings_pair.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_servings_label.dart';

class EatUsecase {
  final StatsRepository _statsRepository;
  final UpdateHungerStatsUsecase _updateHungerStatsUsecase;
  final JournalUsecases _journalUsecases;

  const EatUsecase(
    this._statsRepository,
    this._updateHungerStatsUsecase,
    this._journalUsecases,
  );

  Future<void> execute({
    required int mainPersonID,
    required int gameID,
    required int currentDay,
    required int activityDurationInMinutes,
    required List<FridgeFoodServingPair> fridgeFoodServingPairs,
    required BuildContext context,
    required ShopAndStorageUsecases shopAndStorageUsecases,
    required GameUsecases gameUsecases,
  }) async {
    //if the fridge food list is empty, do nothing

    if (fridgeFoodServingPairs.isNotEmpty) {
      //take food out of the fridge
      for (var fridgeFoodServingPair in fridgeFoodServingPairs) {
        await shopAndStorageUsecases.useFoodUsecase.execute(
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
            (currentFridgeFood.expiryDay < currentDay)
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
        mainPersonID: mainPersonID,
        change: nutrition,
        override: false,
      );

      //log in journal
      await _journalUsecases.addToJournalUsecase.execute(
        gameID: gameID,
        day: currentDay,
        mainPlayerID: mainPersonID,
        entry: firstPersonResultStringBuffer.toString(),
      );

      //move time forward
      await gameUsecases.moveTimeForwardUsecase.execute(
        gameID: gameID,
        timeInMinutes: activityDurationInMinutes,
      );

      //get updated hunger value
      final Stats? updatedStats = await _statsRepository.getStats(mainPersonID);
      final int newHunger = (updatedStats != null) ? updatedStats.hunger : 0;

      //return result dialog
      if (context.mounted) {
        return ResultWithStatsDialog.show(
          context: context,
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
        );
      }
    }
  }
}
