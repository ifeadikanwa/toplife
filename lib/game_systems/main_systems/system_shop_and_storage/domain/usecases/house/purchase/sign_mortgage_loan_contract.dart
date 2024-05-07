import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/model/info_models/economy_adjusted_loan_information.dart';
import 'package:toplife/game_systems/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/house_repository.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_house_name.dart';

class SignMortgageLoanContract {
  final HouseRepository _houseRepository;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final RecurringBillsUsecases _recurringBillsUsecases;
  final DialogHandler _dialogHandler;

  const SignMortgageLoanContract(
    this._houseRepository,
    this._personUsecases,
    this._journalUsecases,
    this._recurringBillsUsecases,
    this._dialogHandler,
  );

  Future<void> execute({
    required Person person,
    required Game currentGame,
    required House house,
    required EconomyAdjustedLoanInformation economyAdjustedLoanInformation,
  }) async {
    //pay down payment
    await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      mainPlayerID: person.id,
      baseAmountToTake: economyAdjustedLoanInformation.downPayment,
      adjustToEconomy: false,
    );

    //add house to storage
    final createdHouse = await _houseRepository.createHouse(
      house.copyWith(
        ownerPersonId: person.id,
        country: person.currentCountry,
        lastMaintainedDay: currentGame.currentDay,
        dayOfPurchase: currentGame.currentDay,
        purchasePrice: getCountryEconomyAdjustedPrice(
          country: person.currentCountry,
          basePrice: house.basePrice,
        ),
        fullyPaidFor: false,
      ),
    );

    //add loan to bills
    await _recurringBillsUsecases.addMortgageLoanToBillsUsecase.execute(
      personID: person.id,
      houseID: createdHouse.id,
      houseAddress: house.address,
      economyAdjustedLoanInformation: economyAdjustedLoanInformation,
    );

    //set entries
    const resultTitle = ShopResultConstants.acceptedLoanApplicationTitle;
    final secondPersonResult =
        ShopResultConstants.mortgageLoanSuccesfulResultEntry(
      country: person.currentCountry,
      recurringPayment: economyAdjustedLoanInformation.installment,
    );
    final journalEntry = ShopResultConstants.loanSuccesfulJournalEntry(
      itemName: getHouseName(
        buildingType: house.buildingType,
        houseDesignStyle: house.style,
      ),
      recurringPayment: economyAdjustedLoanInformation.installment,
      country: person.currentCountry,
    );

    //log in journal
    await _journalUsecases.addToJournalUsecase.execute(
      gameID: currentGame.id,
      day: currentGame.currentDay,
      mainPlayerID: person.id,
      entry: journalEntry,
    );

    //show result
    _dialogHandler.showResultDialog(
      title: resultTitle,
      result: secondPersonResult,
    );
  }
}
