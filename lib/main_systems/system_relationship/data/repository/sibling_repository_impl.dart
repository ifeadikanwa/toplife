import 'package:toplife/main_systems/system_relationship/domain/dao/sibling_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/sibling_repository.dart';

class SiblingRepositoryImpl implements SiblingRepository {
  final SiblingDao _siblingDao;

  const SiblingRepositoryImpl({required SiblingDao siblingDao})
      : _siblingDao = siblingDao;

  @override
  Future<Sibling> createSibling(Sibling sibling) async {
    return _siblingDao.createSibling(sibling);
  }

  @override
  Future<void> deleteSibling(int mainPersonID, int siblingID) async {
    return _siblingDao.deleteSibling(mainPersonID, siblingID);
  }

  @override
  Future<List<Sibling>> getAllSiblings(int mainPersonID) async {
    return _siblingDao.getAllSiblings(mainPersonID);
  }

  @override
  Future<Sibling?> getSibling(int mainPersonID, int siblingID) async {
    return _siblingDao.getSibling(mainPersonID, siblingID);
  }

  @override
  Future<void> updateSibling(Sibling sibling) async {
    return _siblingDao.updateSibling(sibling);
  }

  @override
  Stream<Sibling?> watchSibling(int mainPersonID, int siblingID) {
    return _siblingDao.watchSibling(mainPersonID, siblingID);
  }

  @override
  Stream<List<Sibling>> watchAllSiblings(int mainPersonID) {
    return _siblingDao.watchAllSiblings(mainPersonID);
  }
}
