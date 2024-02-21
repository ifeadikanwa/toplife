import 'package:toplife/main_systems/system_person/domain/dao/stance_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stance_repository.dart';

class StanceRepositoryImpl implements StanceRepository {
  final StanceDao _stanceDao;

  const StanceRepositoryImpl({required StanceDao stanceDao})
      : _stanceDao = stanceDao;

  @override
  Future<Stance> createStance(Stance stance) async {
    return _stanceDao.createStance(stance);
  }

  @override
  Future<void> deleteStance(int stanceID) async {
    return _stanceDao.deleteStance(stanceID);
  }

  @override
  Future<Stance?> getStance(int personID) async {
    return _stanceDao.getStance(personID);
  }

  @override
  Future<void> updateStance(Stance stance) async {
    return _stanceDao.updateStance(stance);
  }
}
