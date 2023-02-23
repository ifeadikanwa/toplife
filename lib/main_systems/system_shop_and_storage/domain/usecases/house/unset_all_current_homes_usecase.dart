import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/house_repository.dart';

class UnsetAllCurrentHomesUsecase {
  final HouseRepository _houseRepository;

  const UnsetAllCurrentHomesUsecase(this._houseRepository);

  Future<void> execute({
    required int personID,
  }) async {
    //get all current homes
    //update them to not current

    final currentHomes = await _houseRepository.getAllCurrentHouses(personID);

    for (House home in currentHomes) {
      await _houseRepository.updateHouse(
        home.copyWith(
          isCurrentHome: false,
        ),
      );
    }
  }
}
