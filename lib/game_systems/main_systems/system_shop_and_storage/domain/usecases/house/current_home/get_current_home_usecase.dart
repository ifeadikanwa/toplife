import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/current_home_repository.dart';

class GetCurrentHomeUsecase {
  final CurrentHomeRepository _currentHomeRepository;

  const GetCurrentHomeUsecase(this._currentHomeRepository);

  Future<CurrentHome?> execute({
    required int personID,
  }) async {
    return _currentHomeRepository.getCurrentHome(personID);
  }
}
