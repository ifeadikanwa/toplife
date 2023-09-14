//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/jewelry_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_carat_label.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_jewelry_name.dart';

class PurchaseJewelryUsecase {
  final JewelryRepository _jewelryRepository;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final GameUsecases _gameUsecases;

  const PurchaseJewelryUsecase(
    this._jewelryRepository,
    this._personUsecases,
    this._journalUsecases,
    this._gameUsecases,
  );

  Future<bool> execute({
    required BuildContext context,
    required Jewelry jewelry,
    required int personID,
  }) async {
    //does not use the storage limit
    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    late final String journalEntry;
    late final String secondPersonResult;
    late final String resultTitle;
    late final bool purchaseSuccessful;

    final String jewelryName = getJewelryName(
      jewel: jewelry.jewel,
      type: jewelry.type,
    );
    final jewelryQuantifier =
        "a ${getCaratLabel(jewel: jewelry.jewel, carat: jewelry.carat)}";

    final bool paymentSuccessful =
        await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      mainPlayerID: personID,
      baseAmountToTake: jewelry.basePrice,
      adjustToEconomy: true,
    );

    //add to storage if successful
    if (paymentSuccessful && currentGame != null) {
      await _jewelryRepository.createJewelry(
        jewelry.copyWith(
          personId: personID,
          dayOfPurchase: currentGame.currentDay,
        ),
      );

      journalEntry = ShopResultConstants.purchaseSuccessfulJournalEntry(
        jewelryName,
        jewelryQuantifier,
      );

      secondPersonResult = ShopResultConstants.jewelryDeliveredResultEntry;

      resultTitle = ShopResultConstants.checkoutSuccessTitle;

      purchaseSuccessful = true;
    }
    //cant afford to pay
    else {
      journalEntry = ShopResultConstants.noFundsJournalEntry(
        jewelryName,
        jewelryQuantifier,
      );

      secondPersonResult = ShopResultConstants.noFundsResultEntry;

      resultTitle = ShopResultConstants.checkoutFailedTitle;

      purchaseSuccessful = false;
    }

    //log in journal
    if (currentGame != null) {
      await _journalUsecases.addToJournalUsecase.execute(
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

    return purchaseSuccessful;
  }
}
