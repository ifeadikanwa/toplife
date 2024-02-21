import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/piercing_repository.dart';

class CreatePiercingUsecase {
  final PiercingRepository _piercingRepository;

  const CreatePiercingUsecase(
    this._piercingRepository,
  );

  Future<Piercing> execute({required Piercing piercing}) async {
    return await _piercingRepository.createPiercing(piercing);
  }
}
