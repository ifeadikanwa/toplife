//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/add_purchased_car_to_storage_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';

class PurchaseCarWithLoanUsecase {
  final AddPurchasedCarToStorageUsecase _addPurchasedCarToStorageUsecase;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final GameUsecases _gameUsecases;
  final RecurringBillsUsecases _recurringBillsUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const PurchaseCarWithLoanUsecase(
    this._addPurchasedCarToStorageUsecase,
    this._personUsecases,
    this._journalUsecases,
    this._gameUsecases,
    this._recurringBillsUsecases,
    this._relationshipUsecases,
  );

  Future<bool> execute({
    required BuildContext context,
    required Car car,
    required int personID,
    required int downPaymentPercentage,
  }) async {
    late final String journalEntry;
    late final String secondPersonResult;
    late final String resultTitle;
    //I made it false since there is only one instance where the loan app is successful. we can override to true there.
    bool purchaseSuccessful = false;

    final String carState = (car.maxConditionAtPurchase == defaultMaxStatsValue)
        ? "brand new"
        : "used";

    final String carNameAndState = "$carState ${car.name} car";

    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: personID,
    );

    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    //if game and person is valid
    if (currentGame != null && person != null) {
      //check if the player has an existing car loan
      final bool hasExistingCarLoan = await _recurringBillsUsecases
          .checkIfThereIsAnExistingCarLoanUsecase
          .execute(
        personID: personID,
      );

      //if yes: reject application
      if (hasExistingCarLoan) {
        resultTitle = ShopResultConstants.rejectedLoanApplicationTitle;
        secondPersonResult =
            ShopResultConstants.existingCarLoanRejectionResultEntry;
        journalEntry = ShopResultConstants.existingCarLoanRejectionJournalEntry(
          carName: carNameAndState,
        );
      }
      //if no: check if they can afford the down payment
      else {
        final int baseDownPayment =
            ((downPaymentPercentage / 100) * car.basePrice).ceil();

        final bool canAffordDownPayment =
            await _personUsecases.checkIfPlayerCanAffordItUsecase.execute(
          relationshipUsecases: _relationshipUsecases,
          personID: personID,
          basePrice: baseDownPayment,
          adjustToEconomy: true,
        );

        //if no: reject application
        if (!canAffordDownPayment) {
          resultTitle = ShopResultConstants.rejectedLoanApplicationTitle;
          secondPersonResult =
              ShopResultConstants.notEnoughFundsForDownPaymentResultEntry;
          journalEntry =
              ShopResultConstants.notEnoughFundsForDownPaymentJournalEntry(
            itemName: carNameAndState,
          );
        }

        //if yes: purchase car and add loan to bills
        else {
          //pay down payment
          await _personUsecases.takeMoneyFromPlayerUsecase.execute(
            relationshipUsecases: _relationshipUsecases,
            mainPlayerID: personID,
            baseAmountToTake: baseDownPayment,
            adjustToEconomy: true,
          );

          //add car to storage
          final Car createdCar = await _addPurchasedCarToStorageUsecase.execute(
            car: car,
            personID: personID,
            dayOfPurchase: currentGame.currentDay,
            fullyPaidFor: false,
          );

          //calculate the loan amount
          final int baseLoanAmount = car.basePrice - baseDownPayment;

          //add loan to bills
          await _recurringBillsUsecases.addCarLoanToBillsUsecase.execute(
            personID: personID,
            baseLoanAmount: baseLoanAmount,
            carID: createdCar.id,
            carName: createdCar.name,
          );

          //get the recurring payment amount for use in the entries
          final int recurringPayment = _recurringBillsUsecases
              .carLoanRecurringPaymentCalculatorUsecase
              .execute(
            baseLoanAmount: baseLoanAmount,
            country: person.currentCountry,
          );

          //set all entries
          resultTitle = ShopResultConstants.acceptedLoanApplicationTitle;
          secondPersonResult = ShopResultConstants.carLoanSuccesfulResultEntry(
            recurringPayment: recurringPayment,
          );
          journalEntry = ShopResultConstants.loanSuccesfulJournalEntry(
            itemName: carNameAndState,
            recurringPayment: recurringPayment,
          );
          //set purchase successful to true
          purchaseSuccessful = true;
        }
      }

      //log in journal
      await _journalUsecases.addToJournalUsecase.execute(
        gameID: currentGame.id,
        day: currentGame.currentDay,
        mainPlayerID: personID,
        entry: journalEntry,
      );

      //show result
      ResultDialog.show(
        context: context,
        title: resultTitle,
        result: secondPersonResult,
      );
    }

    //game and person are not valid
    else {
      ResultDialog.show(
        context: context,
        title: ShopResultConstants.rejectedLoanApplicationTitle,
        result: ShopResultConstants.loanInvalidIDsResultEntry,
      );
    }

    return purchaseSuccessful;
  }
}
