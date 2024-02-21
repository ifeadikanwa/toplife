import 'package:toplife/main_systems/system_relationship/domain/dao/grave_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/grave_repository.dart';

class GraveRepositoryImpl implements GraveRepository {
  final GraveDao _graveDao;

  const GraveRepositoryImpl({required GraveDao graveDao})
      : _graveDao = graveDao;

  @override
  Future<Grave> createGrave(Grave grave) async {
    return _graveDao.createGrave(grave);
  }

  @override
  Future<void> deleteGrave(int mainPersonID, int deadPersonID) async {
    return _graveDao.deleteGrave(mainPersonID, deadPersonID);
  }

  @override
  Future<List<Grave>> getAllGraves(int mainPersonID) async {
    return _graveDao.getAllGraves(mainPersonID);
  }

  @override
  Future<Grave?> getGrave(int mainPersonID, int deadPersonID) async {
    return _graveDao.getGrave(mainPersonID, deadPersonID);
  }

  @override
  Future<void> updateGrave(Grave grave) async {
    return _graveDao.updateGrave(grave);
  }

  @override
  Stream<Grave?> watchGrave(int mainPersonID, int deadPersonID) {
    return _graveDao.watchGrave(mainPersonID, deadPersonID);
  }

  @override
  Stream<List<Grave>> watchAllGraves(int mainPersonID) {
    return _graveDao.watchAllGraves(mainPersonID);
  }
}
