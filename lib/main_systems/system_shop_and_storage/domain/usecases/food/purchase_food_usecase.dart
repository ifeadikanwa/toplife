import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/food.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/food/add_food_to_fridge_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/food/get_food_record_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/food/get_fridge_food_count_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/get_current_house_storage_space_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';

class PurchaseFoodUsecase {
  final AddFoodToFridgeUsecase _addFoodToFridgeUsecase;
  final GetFoodRecordUsecase _getFoodRecordUsecase;
  final GetCurrentHouseStorageSpaceUsecase _getCurrentHouseStorageSpaceUsecase;
  final GetFridgeFoodCountUsecase _getFridgeFoodCountUsecase;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final GameUsecases _gameUsecases;

  const PurchaseFoodUsecase(
    this._addFoodToFridgeUsecase,
    this._getFoodRecordUsecase,
    this._getCurrentHouseStorageSpaceUsecase,
    this._getFridgeFoodCountUsecase,
    this._personUsecases,
    this._journalUsecases,
    this._gameUsecases,
  );

  Future<void> execute({
    required BuildContext context,
    required int personID,
    required Food food,
    required int quantity,
  }) async {
    late final String journalEntry;
    late final String secondPersonResult;
    late final String resultTitle;

    //find the food with name
    final Food foodRecord = await _getFoodRecordUsecase.execute(food: food);

    //check if the user has enough storage space
    final usedStorageSpace = await _getFridgeFoodCountUsecase.execute(
      personID: personID,
    );
    final totalStorageSpace = await _getCurrentHouseStorageSpaceUsecase.execute(
      personID: personID,
    );

    final purchasedFoodNeededStorageSpace = quantity * food.servings;

    //if the purchased food will be able to fit into the storage space
    if ((usedStorageSpace + purchasedFoodNeededStorageSpace) <=
        totalStorageSpace) {
      //try to buy the food
      final bool paymentSuccessful =
          await _personUsecases.takeMoneyFromPlayerUsecase.execute(
        mainPlayerID: personID,
        baseAmountToTake: food.basePrice,
        adjustToEconomy: true,
      );

      //add to storage if successful
      if (paymentSuccessful) {
        await _addFoodToFridgeUsecase.execute(
          personID: personID,
          food: foodRecord,
          quantity: quantity,
        );

        journalEntry = ShopResultConstants.purchaseSuccessfulJournalEntry(
          food.name,
          quantity.toString(),
        );

        secondPersonResult = ShopResultConstants.foodDeliveredResultEntry;

        resultTitle = ShopResultConstants.checkoutSuccessTitle;
      }
      //cant afford to pay
      else {
        journalEntry = ShopResultConstants.noFundsJournalEntry(
          food.name,
          quantity.toString(),
        );

        secondPersonResult = ShopResultConstants.noFundsResultEntry;

        resultTitle = ShopResultConstants.checkoutFailedTitle;
      }
    }
    //not enough storage space
    else {
      journalEntry = ShopResultConstants.noFridgeStorageSpaceJournalEntry(
        food.name,
        quantity.toString(),
      );

      secondPersonResult = ShopResultConstants.noFridgeStorageSpaceResultEntry;

      resultTitle = ShopResultConstants.checkoutFailedTitle;
    }

    //log in journal
    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null && currentGame.id != null) {
      _journalUsecases.addToJournalUsecase.execute(
        gameID: currentGame.id!,
        day: currentGame.currentDay,
        mainPlayerID: personID,
        entry: journalEntry,
      );
    }

    //return results
    ResultDialog.show(
      context: context,
      title: resultTitle,
      result: secondPersonResult,
    );
  }
}
