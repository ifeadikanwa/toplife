import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/current_home_repository.dart';

class SetCurrentHomeUsecase {
  final CurrentHomeRepository _currentHomeRepository;

  const SetCurrentHomeUsecase(this._currentHomeRepository);

  Future<CurrentHome?> execute({
    required CurrentHome currentHome,
  }) async {
    return await _currentHomeRepository.createCurrentHome(currentHome);
  }
}
