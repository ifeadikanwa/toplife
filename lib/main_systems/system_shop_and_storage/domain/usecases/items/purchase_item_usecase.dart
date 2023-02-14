//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/item.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/get_current_house_storage_space_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/add_item_to_storeroom_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/get_item_record_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/items/get_storeroom_item_count_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';

class PurchaseItemUsecase {
  final GetItemRecordUsecase _getItemRecordUsecase;
  final GetStoreroomItemCountUsecase _getStoreroomItemCountUsecase;
  final GetCurrentHouseStorageSpaceUsecase _getCurrentHouseStorageSpaceUsecase;
  final PersonUsecases _personUsecases;
  final AddItemToStoreroomUsecase _addItemToStoreroomUsecase;
  final GameUsecases _gameUsecases;
  final JournalUsecases _journalUsecases;

  const PurchaseItemUsecase(
    this._getItemRecordUsecase,
    this._getStoreroomItemCountUsecase,
    this._getCurrentHouseStorageSpaceUsecase,
    this._personUsecases,
    this._addItemToStoreroomUsecase,
    this._gameUsecases,
    this._journalUsecases,
  );

  Future<void> execute({
    required BuildContext context,
    required int personID,
    required Item item,
    required int quantity,
  }) async {
    late final String journalEntry;
    late final String secondPersonResult;
    late final String resultTitle;

    //find the item with name
    final Item itemRecord = await _getItemRecordUsecase.execute(
      item: item,
    );

    //check if the user has enough storage space
    final usedStorageSpace = await _getStoreroomItemCountUsecase.execute(
      personID: personID,
    );

    final totalStorageSpace = await _getCurrentHouseStorageSpaceUsecase.execute(
      personID: personID,
    );

    final purchasedItemNeededStorageSpace = quantity * item.count;

    //if the purchased item will be able to fit into the storage space
    if ((usedStorageSpace + purchasedItemNeededStorageSpace) <=
        totalStorageSpace) {
      //try to buy the item
      final bool paymentSuccessful =
          await _personUsecases.takeMoneyFromPlayerUsecase.execute(
        mainPlayerID: personID,
        baseAmountToTake: item.basePrice,
        adjustToEconomy: true,
      );

      //add to storage if successful
      if (paymentSuccessful) {
        await _addItemToStoreroomUsecase.execute(
          personID: personID,
          item: itemRecord,
          quantity: quantity,
        );

        journalEntry = ShopResultConstants.purchaseSuccessfulJournalEntry(
          item.name,
          quantity.toString(),
        );

        secondPersonResult = ShopResultConstants.itemDeliveredResultEntry;

        resultTitle = ShopResultConstants.checkoutSuccessTitle;
      }
      //cant afford to pay
      else {
        journalEntry = ShopResultConstants.noFundsJournalEntry(
          item.name,
          quantity.toString(),
        );

        secondPersonResult = ShopResultConstants.noFundsResultEntry;

        resultTitle = ShopResultConstants.checkoutFailedTitle;
      }
    }
    //not enough storage space
    else {
      journalEntry = ShopResultConstants.noStoreroomStorageSpaceJournalEntry(
        item.name,
        quantity.toString(),
      );

      secondPersonResult = ShopResultConstants.noStoreroomStorageSpaceResultEntry;

      resultTitle = ShopResultConstants.checkoutFailedTitle;
    }

    //log in journal
    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    if (currentGame != null) {
      _journalUsecases.addToJournalUsecase.execute(
        gameID: currentGame.id,
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
