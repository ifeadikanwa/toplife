import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/death_record_repository.dart';

class CreateOrUpdateDeathRecordUsecase {
  final DeathRecordRepository _deathRecordRepository;

  const CreateOrUpdateDeathRecordUsecase(
    this._deathRecordRepository,
  );

  Future<DeathRecord> execute({
    required DeathRecord deathRecord,
  }) async {
    return await _deathRecordRepository.createOrUpdateDeathRecord(
      deathRecord,
    );
  }
}
