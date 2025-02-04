import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/tattoo_repository.dart';

class GetPersonTattooUsecase {
   final TattooRepository _tattooRepository;

  const GetPersonTattooUsecase(
    this._tattooRepository,
  );

  Future<Tattoo?> execute({required int tattooID}) async {
    return await _tattooRepository.getTattoo(tattooID);
  }
}
