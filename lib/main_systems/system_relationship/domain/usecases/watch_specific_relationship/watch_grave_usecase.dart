import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/grave_repository.dart';

class WatchGraveUsecase {
  final GraveRepository _graveRepository;

  const WatchGraveUsecase(this._graveRepository);

  Stream<Grave?> execute({
    required int mainPersonID,
    required int graveID,
  }) {
    return _graveRepository.watchGrave(mainPersonID, graveID);
  }
}
