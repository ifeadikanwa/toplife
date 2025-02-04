import 'package:toplife/game_systems/main_systems/system_shop_and_storage/domain/repository/current_home_repository.dart';

class DeleteCurrentHomeUsecase {
  final CurrentHomeRepository _currentHomeRepository;

  const DeleteCurrentHomeUsecase(this._currentHomeRepository);

  Future<void> execute({
    required int personID,
  }) async {
    return await _currentHomeRepository.deleteCurrentHome(personID);
  }
}
