import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/house_repository.dart';

class GetCurrentHouseUsecase {
  final HouseRepository _houseRepository;

  const GetCurrentHouseUsecase(this._houseRepository);

  Future<House?> execute({
    required int personID,
  }) async {
    return _houseRepository.getCurrentHouse(
      personID,
    );
  }
}
