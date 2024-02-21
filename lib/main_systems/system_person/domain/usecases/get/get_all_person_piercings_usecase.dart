import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/piercing_repository.dart';

class GetAllPersonPiercingsUsecase {
  final PiercingRepository _piercingRepository;

  const GetAllPersonPiercingsUsecase(
    this._piercingRepository,
  );

  Future<List<Piercing>> execute({required int personID}) async {
    return await _piercingRepository.getAllPiercings(personID);
  }
}
