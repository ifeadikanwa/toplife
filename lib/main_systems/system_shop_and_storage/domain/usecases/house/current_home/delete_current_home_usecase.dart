import 'package:toplife/main_systems/system_shop_and_storage/domain/repository/current_home_repository.dart';

class DeleteCurrentHomeUsecase {
  final CurrentHomeRepository _currentHomeRepository;

  const DeleteCurrentHomeUsecase(this._currentHomeRepository);

  Future<void> execute({
    required int personID,
  }) async {
    return _currentHomeRepository.deleteCurrentHome(personID);
  }
}
