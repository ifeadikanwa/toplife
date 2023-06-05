import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/parent_repository.dart';

class WatchParentUsecase {
  final ParentRepository _parentRepository;

  const WatchParentUsecase(this._parentRepository);

  Stream<Parent?> execute({
    required int mainPersonID,
    required int parentID,
  }) {
    return _parentRepository.watchParent(mainPersonID, parentID);
  }
}
