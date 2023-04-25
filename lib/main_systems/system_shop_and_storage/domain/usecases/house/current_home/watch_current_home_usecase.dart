import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/current_home_repository.dart';

class WatchCurrentHomeUsecase {
  final CurrentHomeRepository _currentHomeRepository;

  const WatchCurrentHomeUsecase(this._currentHomeRepository);

  Stream<CurrentHome?> execute({
    required int personID,
  }) {
    return _currentHomeRepository.watchCurrentHome(personID);
  }
}
