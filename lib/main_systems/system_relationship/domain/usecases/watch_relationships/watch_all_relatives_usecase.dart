import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relative_repository.dart';

class WatchAllRelativesUsecase {
  final RelativeRepository _relativeRepository;

  WatchAllRelativesUsecase(this._relativeRepository);

  Stream<List<Relative>> execute({required int mainPersonID}) {
    return _relativeRepository.watchAllRelatives(mainPersonID);
  }
}
