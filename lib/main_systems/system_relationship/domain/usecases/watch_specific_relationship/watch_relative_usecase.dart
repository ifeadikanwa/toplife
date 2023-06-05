import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relative_repository.dart';

class WatchRelativeUsecase {
  final RelativeRepository _relativeRepository;

  const WatchRelativeUsecase(this._relativeRepository);

  Stream<Relative?> execute({
    required int mainPersonID,
    required int relativeID,
  }) {
    return _relativeRepository.watchRelative(mainPersonID, relativeID);
  }
}
