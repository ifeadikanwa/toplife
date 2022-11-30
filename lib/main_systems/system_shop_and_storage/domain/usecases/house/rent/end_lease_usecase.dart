import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/house_repository.dart';

class EndLeaseUsecase {
  final HouseRepository _houseRepository;
  final PersonUsecases _personUsecases;
  final RecurringBillsUsecases _recurringBillsUsecases;

  const EndLeaseUsecase(
    this._houseRepository,
    this._personUsecases,
    this._recurringBillsUsecases,
  );

  Future<void> execute({
    required int personID,
    required bool returnSecurityDeposit,
  }) async {
    final allHouses = await _houseRepository.getAllHouses(
      personID,
    );

    final rentals = allHouses
        .where(
          (house) => house.isForRent == true,
        )
        .toList();

    for (House rentalHouse in rentals) {
      //add the deposit in the players account if true
      if (returnSecurityDeposit) {
        await _personUsecases.addMoneyToPlayerUsecase.execute(
          mainPlayerID: personID,
          baseAmountToAdd: rentalHouse.basePrice,
          adjustToEconomy: true,
        );
      }

      //remove the rent from the bill
      //delete the house
      if (rentalHouse.id != null) {
        await _recurringBillsUsecases.removeRentFromBillsUsecase.execute(
          personID: personID,
          houseID: rentalHouse.id!,
        );

        _houseRepository.deleteHouse(rentalHouse.id!);
      }
    }
  }
}
