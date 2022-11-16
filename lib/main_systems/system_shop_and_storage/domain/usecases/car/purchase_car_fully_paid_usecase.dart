import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';

class PurchaseCarFullyPaidUsecase {
  final CarRepository _carRepository;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final GameUsecases _gameUsecases;

  const PurchaseCarFullyPaidUsecase(
    this._carRepository,
    this._personUsecases,
    this._journalUsecases,
    this._gameUsecases,
  );

  Future<void> execute({
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

    const carQuantifier = "a";

    final bool paymentSuccessful =
        await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      mainPlayerID: personID,
      baseAmountToTake: car.basePrice,
      adjustToEconomy: true,
    );

    //add to storage if successful
    if (paymentSuccessful && currentGame != null) {
      await _carRepository.createCar(
        car.copyWith(
          personID: personID,
          dayOfPurchase: currentGame.currentDay,
          fullyPaidFor: true,
        ),
      );

      journalEntry = ShopResultConstants.purchaseSuccessfulJournalEntry(
        car.name,
        carQuantifier,
      );

      secondPersonResult = ShopResultConstants.carDeliveredResultEntry;

      resultTitle = ShopResultConstants.checkoutSuccessTitle;
    }
    //cant afford to pay
    else {
      journalEntry = ShopResultConstants.noFundsJournalEntry(
        car.name,
        carQuantifier,
      );

      secondPersonResult = ShopResultConstants.noFundsResultEntry;

      resultTitle = ShopResultConstants.checkoutFailedTitle;

    }

    //log in journal
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
