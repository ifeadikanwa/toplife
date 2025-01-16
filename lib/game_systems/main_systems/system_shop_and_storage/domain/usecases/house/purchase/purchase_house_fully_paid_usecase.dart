import 'package:toplife/core/dialogs/dialog_handler.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/game_manager/domain/usecases/game_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_journal/domain/usecases/journal_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/house_repository.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/shop_result_constants/shop_result_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/util/get_house_name.dart';

class PurchaseHouseFullyPaidUsecase {
  final HouseRepository _houseRepository;
  final PersonUsecases _personUsecases;
  final JournalUsecases _journalUsecases;
  final GameUsecases _gameUsecases;
  final DialogHandler _dialogHandler;

  const PurchaseHouseFullyPaidUsecase(
    this._houseRepository,
    this._personUsecases,
    this._journalUsecases,
    this._gameUsecases,
    this._dialogHandler,
  );

  Future<bool> execute({
    required House house,
    required int personID,
  }) async {
    //does not check the storage limit because the user would have to manually move in, it's not automatic on purchase like renting is.
    final Game? currentGame =
        await _gameUsecases.getLastPlayedActiveGameUsecase.execute();

    final Person? person = await _personUsecases.getPersonUsecase.execute(
      personID: personID,
    );

    late final String journalEntry;
    late final String secondPersonResult;
    late final String resultTitle;
    late final bool purchaseSuccessful;

    final houseName = getHouseName(
      buildingType: house.buildingType,
      houseDesignStyle: house.style,
    );
    const houseQuantifier = "a";

    final bool paymentSuccessful =
        await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      mainPlayerID: personID,
      baseAmountToTake: house.basePrice,
      adjustToEconomy: true,
    );

    //add to storage if successful
    if (paymentSuccessful && currentGame != null && person != null) {
      final int purchasePrice = getCountryEconomyAdjustedPrice(
        country: person.currentCountry,
        basePrice: house.basePrice,
      );

      await _houseRepository.createHouse(
        house.copyWith(
          ownerPersonId: personID,
          dayOfPurchase: currentGame.currentDay,
          lastMaintainedDay: currentGame.currentDay,
          country: person.currentCountry,
          purchasePrice: purchasePrice,
          fullyPaidFor: true,
        ),
      );

      journalEntry = ShopResultConstants.purchaseSuccessfulJournalEntry(
        houseName,
        houseQuantifier,
      );

      secondPersonResult = ShopResultConstants.housePurchasedResultEntry;

      resultTitle = ShopResultConstants.housePurchaseCheckoutSuccessTitle;

      purchaseSuccessful = true;
    }

    //cant afford to pay
    else {
      journalEntry = ShopResultConstants.noFundsJournalEntry(
        houseName,
        houseQuantifier,
      );

      secondPersonResult = ShopResultConstants.noFundsResultEntry;

      resultTitle = ShopResultConstants.houseCheckoutFailedTitle;

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
    _dialogHandler.showResultDialog(
      title: resultTitle,
      result: secondPersonResult,
    );

    return purchaseSuccessful;
  }
}
