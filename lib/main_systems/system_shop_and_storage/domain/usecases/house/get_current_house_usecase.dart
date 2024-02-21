import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/current_home_repository.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/house_repository.dart';

class GetCurrentHouseUsecase {
  final HouseRepository _houseRepository;
  final CurrentHomeRepository _currentHomeRepository;

  const GetCurrentHouseUsecase(
    this._houseRepository,
    this._currentHomeRepository,
  );

  Future<House?> execute({
    required int personID,
  }) async {
    final CurrentHome? currentHome =
        await _currentHomeRepository.getCurrentHome(personID);

    if (currentHome == null) {
      return null;
    } else {
      return await _houseRepository.getHouse(currentHome.houseId);
    }
  }
}
