import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_recurring_bills_and_loans/domain/usecases/recurring_bills_usecases.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/usecases/relationship_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/house_repository.dart';

class EndLeaseUsecase {
  final HouseRepository _houseRepository;
  final PersonUsecases _personUsecases;
  final RecurringBillsUsecases _recurringBillsUsecases;
  final RelationshipUsecases _relationshipUsecases;

  const EndLeaseUsecase(
    this._houseRepository,
    this._personUsecases,
    this._recurringBillsUsecases,
    this._relationshipUsecases,
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
          relationshipUsecases: _relationshipUsecases,
          mainPlayerID: personID,
          baseAmountToAdd: rentalHouse.basePrice,
          adjustToEconomy: true,
        );
      }

      //remove the rent from the bill
      //delete the house
      await _recurringBillsUsecases.removeRentFromBillsUsecase.execute(
        personID: personID,
        houseID: rentalHouse.id,
      );

      await _houseRepository.deleteHouse(rentalHouse.id);
    }
  }
}
