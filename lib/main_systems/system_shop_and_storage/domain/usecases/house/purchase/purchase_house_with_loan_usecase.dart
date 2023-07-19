//the called dialogs already check for context mount status
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/constants/recurring_bill_constants.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/purchase/sign_mortgage_loan_contract.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_name.dart';

class PurchaseHouseWithLoanUsecase {
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final GameUsecases _gameUsecases;
  final RecurringBillsUsecases _recurringBillsUsecases;
  final SignMortgageLoanContract _signMortgageLoanContract;
  final RelationshipUsecases _relationshipUsecases;

  const PurchaseHouseWithLoanUsecase(
    this._personUsecases,
    this._journalUsecases,
    this._gameUsecases,
    this._recurringBillsUsecases,
    this._signMortgageLoanContract,
    this._relationshipUsecases,
  );

  Future<bool> execute({
    required BuildContext context,
    required House house,
    required int downPaymentPercentage,
    required int personID,
  }) async {
    //does not check the storage limit because the user would have to manually move in, it's not automatic on purchase like renting is.

    late final String journalEntry;
    late final String secondPersonResult;
    late final String resultTitle;

    //we override and return at the points where loan is approved
    bool purchaseSuccessful = false;

    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: personID,
    );

    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    final String houseName = getHouseName(
      buildingType: house.buildingType,
      houseDesignStyle: house.style,
    );

    //if game and person is valid
    if (currentGame != null && person != null) {
      final int baseDownPayment =
          ((downPaymentPercentage / 100) * house.basePrice).ceil();

      //check if player can afford to pay down payment
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
          itemName: houseName,
        );
      }
      //if yes: check if there's an existing mortgage loan
      else {
        final bool hasExistingMortgageLoan = await _recurringBillsUsecases
            .checkIfThereIsAnExistingMortgageLoanUsecase
            .execute(
          personID: personID,
        );

        //if no: purchase house and add loan to bills (approved)
        if (!hasExistingMortgageLoan) {
          //return is used because we don't need to run anything else outside this block.
          await _signMortgageLoanContract.execute(
            context: context,
            person: person,
            currentGame: currentGame,
            house: house,
            baseDownPayment: baseDownPayment,
          );

          purchaseSuccessful = true;

          return purchaseSuccessful;
        }

        //if yes: check if they have expected reserve in the bank, in addition to the down payment
        else {
          final int baseExpectedReserveAmount = ((RecurringBillConstants
                          .multipleLoansExpectedBankReservePercentage /
                      100) *
                  house.basePrice)
              .ceil();

          final int baseAllExpectedAmount =
              baseExpectedReserveAmount + baseDownPayment;

          //checking
          final bool hasEnoughInReserve =
              await _personUsecases.checkIfPlayerCanAffordItUsecase.execute(
            relationshipUsecases: _relationshipUsecases,
            personID: personID,
            basePrice: baseAllExpectedAmount,
            adjustToEconomy: true,
          );

          //if no: reject application
          if (!hasEnoughInReserve) {
            resultTitle = ShopResultConstants.rejectedLoanApplicationTitle;
            secondPersonResult =
                ShopResultConstants.notEnoughInReserveLoanRejectionResultEntry;
            journalEntry =
                ShopResultConstants.notEnoughInReserveLoanRejectionJournalEntry(
              houseName: houseName,
            );
          }
          //if yes: purchase house and add loans to bills (approved)
          else {
            //return is used because we don't need to run anything else outside this block.
            await _signMortgageLoanContract.execute(
              context: context,
              person: person,
              currentGame: currentGame,
              house: house,
              baseDownPayment: baseDownPayment,
            );

            purchaseSuccessful = true;

            return purchaseSuccessful;
          }
        }
      }

      //if contract is not signed you reach here
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

    //if game and person is not valid
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
