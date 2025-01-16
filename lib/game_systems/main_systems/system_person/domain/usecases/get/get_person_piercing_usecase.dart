import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/piercing_repository.dart';

class GetPersonPiercingUsecase {
   final PiercingRepository _piercingRepository;

  const GetPersonPiercingUsecase(
    this._piercingRepository,
  );

  Future<Piercing?> execute({required int piercingID}) async {
    return await _piercingRepository.getPiercing(piercingID);
  }
}
