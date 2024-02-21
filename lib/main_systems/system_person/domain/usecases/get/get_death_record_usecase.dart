import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/death_record_repository.dart';

class GetDeathRecordUsecase {
  final DeathRecordRepository _deathRecordRepository;

  const GetDeathRecordUsecase(
    this._deathRecordRepository,
  );

  Future<DeathRecord?> execute({
    required int gameID,
    required int personID,
  }) async {
    return await _deathRecordRepository.getDeathRecord(
      gameID,
      personID,
    );
  }
}
