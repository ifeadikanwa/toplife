import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/tattoo_repository.dart';

class CreateTattooUsecase {
  final TattooRepository _tattooRepository;

  const CreateTattooUsecase(
    this._tattooRepository,
  );

  Future<Tattoo> execute({required Tattoo tattoo}) async {
    return await _tattooRepository.createTattoo(tattoo);
  }
}
