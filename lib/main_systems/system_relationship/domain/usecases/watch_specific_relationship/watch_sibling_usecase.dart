import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/sibling_repository.dart';

class WatchSiblingUsecase {
  final SiblingRepository _siblingRepository;

  const WatchSiblingUsecase(this._siblingRepository);

  Stream<Sibling?> execute({
    required int mainPersonID,
    required int siblingID,
  }) {
    return _siblingRepository.watchSibling(mainPersonID, siblingID);
  }
}
