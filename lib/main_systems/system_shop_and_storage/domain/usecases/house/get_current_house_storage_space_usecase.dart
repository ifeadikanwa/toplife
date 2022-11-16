import 'package:toplife/main_systems/system_shop_and_storage/domain/model/house.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/usecases/house/get_current_house_usecase.dart';

class GetCurrentHouseStorageSpaceUsecase {
  final GetCurrentHouseUsecase _getCurrentHouseUsecase;
  const GetCurrentHouseStorageSpaceUsecase(this._getCurrentHouseUsecase);

  Future<int> execute({
    required int personID,
  }) async {
    //get the players current home
    //if they have no current home, return homeless storage space

    final House? currentHome = await _getCurrentHouseUsecase.execute(
      personID: personID,
    );

    if (currentHome != null) {
      return currentHome.storage;
    } else {
      return House.homelessStorageSpace;
    }
  }
}
