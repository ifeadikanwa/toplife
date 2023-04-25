import 'package:toplife/main_systems/system_location/util/get_country_economy_adjusted_price.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/house_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/move_into_new_house_usecase.dart';

class SignLeaseForRentalUsecase {
  final HouseRepository _houseRepository;
  final RecurringBillsUsecases _recurringBillsUsecases;
  final MoveIntoNewHouseUsecase _moveIntoNewHouseUsecase;
  final PersonUsecases _personUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const SignLeaseForRentalUsecase(
    this._houseRepository,
    this._recurringBillsUsecases,
    this._moveIntoNewHouseUsecase,
    this._personUsecases,
    this._relationshipUsecases,
  );

  Future<String> execute({
    required int leaseDuration,
    required int personID,
    required House house,
    required int currentDay,
    required String country,
  }) async {
    //get economy adjusted rent price
    final economyAdjustedRentPrice = getCountryEconomyAdjustedPrice(
      country: country,
      basePrice: house.basePrice,
    );

    //calculate lease end day
    final int endOfLeaseDay = currentDay + leaseDuration - 1;

    //pay rent + security deposit
    await _personUsecases.takeMoneyFromPlayerUsecase.execute(
      relationshipUsecases: _relationshipUsecases,
      mainPlayerID: personID,
      baseAmountToTake: economyAdjustedRentPrice * 2,
      adjustToEconomy: false,
    );

    //register the house as renting
    final House createdHouse = await _houseRepository.createHouse(
      house.copyWith(
        ownerPersonId: personID,
        endOfLeaseDay: endOfLeaseDay,
        purchasePrice: economyAdjustedRentPrice,
        dayOfPurchase: currentDay,
        country: country,
        lastMaintainedDay: currentDay,
        fullyPaidFor: true,
      ),
    );

    //add rent to bills
    _recurringBillsUsecases.addRentToBillsUsecase.execute(
      personID: personID,
      billAmount: economyAdjustedRentPrice,
      houseID: createdHouse.id,
      address: createdHouse.address,
    );

    //move the user to house
    //sets as current home and returns a string describing the move(if items were left behind, if all your items were successfully moved.)
    final String moveStatus = await _moveIntoNewHouseUsecase.execute(
      personID: personID,
      newHouse: createdHouse,
    );

    //return string of the move status
    return moveStatus;
  }
}
