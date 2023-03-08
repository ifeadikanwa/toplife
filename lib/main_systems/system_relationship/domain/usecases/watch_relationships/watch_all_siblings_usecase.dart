import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/sibling_repository.dart';

class WatchAllSiblingsUsecase {
  final SiblingRepository _siblingRepository;

  WatchAllSiblingsUsecase(this._siblingRepository);

  Stream<List<Sibling>> execute({required int mainPersonID}) {
    return _siblingRepository.watchAllSiblings(mainPersonID);
  }
}
