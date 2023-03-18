//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';

class PurchaseCarFullyPaidUsecase {
  final CarRepository _carRepository;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final GameUsecases _gameUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const PurchaseCarFullyPaidUsecase(
    this._carRepository,
    this._personUsecases,
    this._journalUsecases,
    this._gameUsecases,
    this._relationshipUsecases,
  );

  Future<bool> execute({
    required BuildContext context,
    required Car car,
    required int personID,
  }) async {
    //does not use the storage limit
    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    late final String journalEntry;
    late final String secondPersonResult;
    late final String resultTitle;
    late final bool purchaseSuccessful;

    //if max condition is not 100, the car is used
    String carQuantifier = "a ";
    (car.maxConditionAtPurchase == maxStatsValue)
        ? carQuantifier += "brand new"
        : carQuantifier += "used";

    final bool paymentSuccessful =
        await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      relationshipUsecases: _relationshipUsecases,
      mainPlayerID: personID,
      baseAmountToTake: car.basePrice,
      adjustToEconomy: true,
    );

    //add to storage if successful
    if (paymentSuccessful && currentGame != null) {
      await _carRepository.createCar(
        car.copyWith(
          personId: personID,
          dayOfPurchase: currentGame.currentDay,
          fullyPaidFor: true,
        ),
      );

      journalEntry = ShopResultConstants.purchaseSuccessfulJournalEntry(
        "${car.name} car",
        carQuantifier,
      );

      secondPersonResult = ShopResultConstants.carDeliveredResultEntry;

      resultTitle = ShopResultConstants.checkoutSuccessTitle;

      purchaseSuccessful = true;
    }
    //cant afford to pay
    else {
      journalEntry = ShopResultConstants.noFundsJournalEntry(
        car.name,
        carQuantifier,
      );

      secondPersonResult = ShopResultConstants.noFundsResultEntry;

      resultTitle = ShopResultConstants.checkoutFailedTitle;

      purchaseSuccessful = false;
    }

    //log in journal
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

    return purchaseSuccessful;
  }
}
