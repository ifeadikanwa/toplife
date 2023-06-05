import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/inlaw_repository.dart';

class WatchInLawUsecase {
  final InLawRepository _inLawRepository;

  const WatchInLawUsecase(this._inLawRepository);

  Stream<InLaw?> execute({
    required int mainPersonID,
    required int inLawID,
  }) {
    return _inLawRepository.watchInLaw(mainPersonID, inLawID);
  }
}
