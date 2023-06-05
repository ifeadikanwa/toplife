import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/child_repository.dart';

class WatchChildUsecase {
  final ChildRepository _childRepository;

  const WatchChildUsecase(this._childRepository);

  Stream<Child?> execute({
    required int mainPersonID,
    required int childID,
  }) {
    return _childRepository.watchChild(mainPersonID, childID);
  }
}
