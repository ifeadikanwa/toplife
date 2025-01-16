import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/current_home_repository.dart';

class WatchAllPeopleInAHouseUsecase {
  final CurrentHomeRepository _currentHomeRepository;

  const WatchAllPeopleInAHouseUsecase(this._currentHomeRepository);

  Stream<List<CurrentHome>> execute({
    required int houseID,
  }) {
    return _currentHomeRepository.watchAllPeopleInAHouse(houseID);
  }
}
