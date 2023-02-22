import 'package:toplife/main_systems/system_relationship/domain/dao/graveyard_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/graveyard_repository.dart';

class GraveyardRepositoryImpl implements GraveyardRepository {
  final GraveyardDao _graveyardDao;

  const GraveyardRepositoryImpl({required GraveyardDao graveyardDao})
      : _graveyardDao = graveyardDao;

  @override
  Future<Graveyard> createGraveyard(Graveyard graveyard) async {
    return _graveyardDao.createGraveyard(graveyard);
  }

  @override
  Future<void> deleteGraveyard(int mainPersonID, int deadPersonID) async {
    return _graveyardDao.deleteGraveyard(mainPersonID, deadPersonID);
  }

  @override
  Future<List<Graveyard>> getAllGraveyards(int mainPersonID) async {
    return _graveyardDao.getAllGraveyards(mainPersonID);
  }

  @override
  Future<Graveyard?> getGraveyard(int mainPersonID, int deadPersonID) async {
    return _graveyardDao.getGraveyard(mainPersonID, deadPersonID);
  }

  @override
  Future<void> updateGraveyard(Graveyard graveyard) async {
    return _graveyardDao.updateGraveyard(graveyard);
  }

  @override
  Stream<Graveyard?> watchGraveyard(int mainPersonID, int deadPersonID) {
    return _graveyardDao.watchGraveyard(mainPersonID, deadPersonID);
  }

  @override
  Stream<List<Graveyard>> watchAllGraveyards(int mainPersonID) {
    return _graveyardDao.watchAllGraveyards(mainPersonID);
  }
}
