import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/parent_repository.dart';

class WatchAllActiveParentsUsecase {
  final ParentRepository _parentRepository;

  WatchAllActiveParentsUsecase(this._parentRepository);

  Stream<List<Parent>> execute({required int mainPersonID}) {
    return _parentRepository.watchAllActiveParents(mainPersonID);
  }
}
