import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/domain/repository/precollege_repository.dart';

class CreateOrUpdatePrecollegeUsecase {
  final PrecollegeRepository _precollegeRepository;

  const CreateOrUpdatePrecollegeUsecase(this._precollegeRepository);

  Future<Precollege> execute({required Precollege precollege}) async {
    //we create or update the record if it already exists

    return _precollegeRepository.createPrecollege(precollege);
  }
}
