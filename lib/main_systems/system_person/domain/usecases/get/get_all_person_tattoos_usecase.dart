import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/tattoo_repository.dart';

class GetAllPersonTattoosUsecase {
  final TattooRepository _tattooRepository;

  const GetAllPersonTattoosUsecase(
    this._tattooRepository,
  );

  Future<List<Tattoo>> execute({required int personID}) async {
    return await _tattooRepository.getAllTattoos(personID);
  }
}
