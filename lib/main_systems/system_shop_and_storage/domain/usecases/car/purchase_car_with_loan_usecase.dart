//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/car_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';

class PurchaseCarWithLoanUsecase {
  final CarRepository _carRepository;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final GameUsecases _gameUsecases;
  final RecurringBillsUsecases _recurringBillsUsecases;

  const PurchaseCarWithLoanUsecase(
    this._carRepository,
    this._personUsecases,
    this._journalUsecases,
    this._gameUsecases,
    this._recurringBillsUsecases,
  );

  Future<void> execute({
    required BuildContext context,
    required Car car,
    required int personID,
    required int downPaymentPercentage,
  }) async {
    late final String journalEntry;
    late final String secondPersonResult;
    late final String resultTitle;

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
          carName: car.name,
        );
      }
      //if no: check if they can afford the down payment
      else {
        final int baseDownPayment =
            ((downPaymentPercentage / 100) * car.basePrice).ceil();

        final bool canAffordDownPayment =
            await _personUsecases.checkIfPlayerCanAffordItUsecase.execute(
          personID: personID,
          basePrice: baseDownPayment,
          country: person.country,
          adjustToEconomy: true,
        );

        //if no: reject application
        if (!canAffordDownPayment) {
          resultTitle = ShopResultConstants.rejectedLoanApplicationTitle;
          secondPersonResult =
              ShopResultConstants.notEnoughFundsForDownPaymentResultEntry;
          journalEntry =
              ShopResultConstants.notEnoughFundsForDownPaymentJournalEntry(
            itemName: car.name,
          );
        }

        //if yes: purchase car and add loan to bills
        else {
          //pay down payment
          await _personUsecases.takeMoneyFromPlayerUsecase.execute(
            mainPlayerID: personID,
            baseAmountToTake: baseDownPayment,
            adjustToEconomy: true,
          );

          //add car to storage
          final Car createdCar = await _carRepository.createCar(
            car.copyWith(
              personID: personID,
              dayOfPurchase: currentGame.currentDay,
              fullyPaidFor: false,
            ),
          );

          //calculate the loan amount
          final int baseLoanAmount = car.basePrice - baseDownPayment;

          //add loan to bills
          await _recurringBillsUsecases.addCarLoanToBillsUsecase.execute(
            personID: personID,
            baseLoanAmount: baseLoanAmount,
            carID: createdCar.id!,
            carName: createdCar.name,
          );

          //get the recurring payment amount for use in the entries
          final int recurringPayment = _recurringBillsUsecases
              .carLoanRecurringPaymentCalculatorUsecase
              .execute(
            baseLoanAmount: baseLoanAmount,
            country: person.country,
          );

          //set all entries
          resultTitle = ShopResultConstants.acceptedLoanApplicationTitle;
          secondPersonResult = ShopResultConstants.carLoanSuccesfulResultEntry(
            recurringPayment: recurringPayment,
          );
          journalEntry = ShopResultConstants.loanSuccesfulJournalEntry(
            itemName: createdCar.name,
            recurringPayment: recurringPayment,
          );
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
  }
}
