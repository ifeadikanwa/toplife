import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/appearance_dao.dart';
import 'package:toplife/main_systems/system_person/domain/repository/appearance_repository.dart';

class AppearanceRepositoryImpl implements AppearanceRepository {
  final AppearanceDao _appearanceDao;

  const AppearanceRepositoryImpl({
    required AppearanceDao appearanceDao,
  }) : _appearanceDao = appearanceDao;

  @override
  Future<Appearance> createOrUpdateAppearance(Appearance appearance) async {
    return _appearanceDao.createOrUpdateAppearance(appearance);
  }

  @override
  Future<void> deleteAppearance(int personID) async {
    return _appearanceDao.deleteAppearance(personID);
  }

  @override
  Future<Appearance?> getAppearance(int personID) async {
    return _appearanceDao.getAppearance(personID);
  }
}
