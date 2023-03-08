import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/inlaw_repository.dart';

class WatchAllInLawsUsecase {
  final InLawRepository _inLawRepository;

  WatchAllInLawsUsecase(this._inLawRepository);

  Stream<List<InLaw>> execute({required int mainPersonID}) {
    return _inLawRepository.watchAllInLaws(mainPersonID);
  }
}
