import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/car.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/shop_and_storage_usecases.dart';
import 'package:toplife/main_systems/system_transportation/constants/transport_mode.dart';

class ChangeTransportModeUsecase {
  final PersonUsecases _personUsecases;
  final ShopAndStorageUsecases _shopAndStorageUsecases;
  const ChangeTransportModeUsecase(
    this._personUsecases,
    this._shopAndStorageUsecases,
  );

  Future<void> execute({
    required TransportMode transportMode,
    required Car car,
    required int personID,
  }) async {
    //get the person
    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: personID);

    //update the person with the new transport mode
    if (person != null) {
      await _personUsecases.updatePersonUsecase.execute(
        person: person.copyWith(
          transportMode: transportMode.name,
        ),
      );

      if (transportMode == TransportMode.private) {
        //unselect all currently driving cars
        await _shopAndStorageUsecases
            .setAllPersonCarsToNotCurrentlyDrivingUsecase
            .execute(
          personID: personID,
        );

        //select the sent car
        await _shopAndStorageUsecases.updateCarUsecase.execute(
          car: car.copyWith(
            currentlyDriving: true,
          ),
        );
      }
    }
  }
}
