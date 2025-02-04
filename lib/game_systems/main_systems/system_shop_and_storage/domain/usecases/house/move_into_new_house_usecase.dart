import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/text_constants.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/person_usecases.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/stay_type.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/current_home/set_current_home_usecase.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/move_storage_to_new_house_usecase.dart';

class MoveIntoNewHouseUsecase {
  final PersonUsecases _personUsecases;
  final MoveStorageToNewHouseUsecase _moveStorageToNewHouseUsecase;
  final SetCurrentHomeUsecase _setCurrentHomeUsecase;

  const MoveIntoNewHouseUsecase(
    this._personUsecases,
    this._moveStorageToNewHouseUsecase,
    this._setCurrentHomeUsecase,
  );

  Future<String> execute({
    required int personID,
    required House newHouse,
  }) async {
    //get person info
    final Person? person =
        await _personUsecases.getPersonUsecase.execute(personID: personID);

    if (person != null) {
      //set persons current state and country as the state and country their house is in
      //I set country too because this is a good point to reset country if for some reason it becomes inconsistent.
      await _personUsecases.updatePersonUsecase.execute(
        person: person.copyWith(
          currentCountry: newHouse.country,
          currentState: newHouse.state,
        ),
      );

      //set the current home to point to the newhouse
      final CurrentHome currentHome = CurrentHome(
        personId: person.id,
        houseId: newHouse.id,
        hasManagementRights: true,
        isAtHome: true,
        stayType: StayType.indefinitely.name,
        exitDay: 0,
      );

      await _setCurrentHomeUsecase.execute(currentHome: currentHome);

      //move their storage to new house
      final String moveStatus = await _moveStorageToNewHouseUsecase.execute(
        personID: personID,
        newHouseStorageSize: newHouse.storage,
      );

      return moveStatus;
    }

    //if person is not valid, return empty string
    return TextConstants.emptyString;
  }
}
