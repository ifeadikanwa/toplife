import 'package:flutter/cupertino.dart';
import 'package:toplife/core/dialogs/result_dialog.dart';
import 'package:toplife/game_manager/domain/model/game.dart';
import 'package:toplife/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/house_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';
import 'package:toplife/main_systems/system_shop_and_storage/util/get_house_name.dart';

class SignMortgageLoanContract {
  final HouseRepository _houseRepository;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;

  final RecurringBillsUsecases _recurringBillsUsecases;

  const SignMortgageLoanContract(
    this._houseRepository,
    this._personUsecases,
    this._journalUsecases,
    this._recurringBillsUsecases,
  );

  Future<void> execute({
    required BuildContext context,
    required Person person,
    required Game currentGame,
    required House house,
    required int baseDownPayment,
  }) async {
    //pay down payment
    await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      mainPlayerID: person.id!,
      baseAmountToTake: baseDownPayment,
      adjustToEconomy: true,
    );

    //add house to storage
    final createdHouse = await _houseRepository.createHouse(
      house.copyWith(
        personID: person.id!,
        isCurrentHome: false,
        country: person.country,
        lastMaintainedDay: currentGame.currentDay,
        dayOfPurchase: currentGame.currentDay,
        purchasePrice: getCountryEconomyAdjustedPrice(
          country: person.country,
          basePrice: house.basePrice,
        ),
        fullyPaidFor: false,
      ),
    );

    //calculate the loan amount
    final int baseLoanAmount = house.basePrice - baseDownPayment;

    //add loan to bills
    await _recurringBillsUsecases.addMortgageLoanToBillsUsecase.execute(
      personID: person.id!,
      baseLoanAmount: baseLoanAmount,
      houseID: createdHouse.id!,
      houseAddress: house.address,
    );

    //calculate the recurring payment for use in the entries
    final int recurringPayment = _recurringBillsUsecases
        .mortgageLoanRecurringPaymentCalculatorUsecase
        .execute(
      baseLoanAmount: baseLoanAmount,
      country: person.country,
    );

    //set entries
    const resultTitle = ShopResultConstants.acceptedLoanApplicationTitle;
    final secondPersonResult =
        ShopResultConstants.mortgageLoanSuccesfulResultEntry(
      recurringPayment: recurringPayment,
    );
    final journalEntry = ShopResultConstants.loanSuccesfulJournalEntry(
      itemName: getHouseName(
        buildingType: house.buildingType,
        houseDesignStyle: house.style,
      ),
      recurringPayment: recurringPayment,
    );

    //log in journal
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: currentGame.id!,
      day: currentGame.currentDay,
      mainPlayerID: person.id!,
      entry: journalEntry,
    );

    //show result
    ResultDialog.show(
      context: context,
      title: resultTitle,
      result: secondPersonResult,
    );
  }
}
