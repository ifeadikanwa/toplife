import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/current_home_repository.dart';

class GetAllPeopleInAHouseUsecase {
  final CurrentHomeRepository _currentHomeRepository;

  const GetAllPeopleInAHouseUsecase(this._currentHomeRepository);

  Future<List<CurrentHome>> execute({
    required int houseID,
  }) async {
    return _currentHomeRepository.getAllPeopleInAHouse(houseID);
  }
}