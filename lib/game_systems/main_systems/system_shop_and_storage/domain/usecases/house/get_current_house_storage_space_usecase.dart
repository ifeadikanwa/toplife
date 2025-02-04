import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/constants/house_constants.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/usecases/house/get_current_house_usecase.dart';

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
      return HouseConstants.homelessStorageSpace;
    }
  }
}
