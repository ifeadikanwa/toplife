import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/child_repository.dart';

class WatchAllChildrenUsecase {
  final ChildRepository _childRepository;

  WatchAllChildrenUsecase(this._childRepository);

  Stream<List<Child>> execute({required int mainPersonID}) {
    return _childRepository.watchAllChildren(mainPersonID);
  }
}
