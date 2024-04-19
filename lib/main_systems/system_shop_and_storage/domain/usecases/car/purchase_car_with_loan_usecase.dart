import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/model/info_models/economy_adjusted_loan_information.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/car/add_purchased_car_to_storage_usecase.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';

class PurchaseCarWithLoanUsecase {
  final AddPurchasedCarToStorageUsecase _addPurchasedCarToStorageUsecase;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final GameUsecases _gameUsecases;
  final RecurringBillsUsecases _recurringBillsUsecases;
  final DialogHandler _dialogHandler;

  const PurchaseCarWithLoanUsecase(
    this._addPurchasedCarToStorageUsecase,
    this._personUsecases,
    this._journalUsecases,
    this._gameUsecases,
    this._recurringBillsUsecases,
    this._dialogHandler,
  );

  Future<bool> execute({
    required Car car,
    required int personID,
    required EconomyAdjustedLoanInformation economyAdjustedLoanInformation,
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
        final bool canAffordDownPayment =
            await _personUsecases.checkIfPlayerCanAffordItUsecase.execute(
          personID: personID,
          basePrice: economyAdjustedLoanInformation.downPayment,
          adjustToEconomy: false,
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
            mainPlayerID: personID,
            baseAmountToTake: economyAdjustedLoanInformation.downPayment,
            adjustToEconomy: false,
          );

          //add car to storage
          final Car createdCar = await _addPurchasedCarToStorageUsecase.execute(
            car: car,
            personID: personID,
            dayOfPurchase: currentGame.currentDay,
            fullyPaidFor: false,
          );

          //add loan to bills
          await _recurringBillsUsecases.addCarLoanToBillsUsecase.execute(
            personID: personID,
            carID: createdCar.id,
            carName: createdCar.name,
            economyAdjustedLoanInformation: economyAdjustedLoanInformation,
          );

          //set all entries
          resultTitle = ShopResultConstants.acceptedLoanApplicationTitle;
          secondPersonResult = ShopResultConstants.carLoanSuccesfulResultEntry(
            country: person.currentCountry,
            recurringPayment: economyAdjustedLoanInformation.installment,
          );
          journalEntry = ShopResultConstants.loanSuccesfulJournalEntry(
            itemName: carNameAndState,
            recurringPayment: economyAdjustedLoanInformation.installment,
            country: person.currentCountry,
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
      _dialogHandler.showResultDialog(
        title: resultTitle,
        result: secondPersonResult,
      );
    }

    //game and person are not valid
    else {
      _dialogHandler.showResultDialog(
        title: ShopResultConstants.rejectedLoanApplicationTitle,
        result: ShopResultConstants.loanInvalidIDsResultEntry,
      );
    }

    return purchaseSuccessful;
  }
}
