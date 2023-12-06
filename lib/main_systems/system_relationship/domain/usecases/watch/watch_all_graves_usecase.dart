import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/grave_repository.dart';

class WatchAllGravesUsecase {
  final GraveRepository _graveRepository;

  WatchAllGravesUsecase(this._graveRepository);

  Stream<List<Grave>> execute({required int mainPersonID}) {
    return _graveRepository.watchAllGraves(mainPersonID);
  }
}
