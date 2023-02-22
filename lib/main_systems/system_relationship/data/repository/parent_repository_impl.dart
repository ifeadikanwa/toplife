import 'package:toplife/main_systems/system_relationship/domain/dao/parent_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/parent_repository.dart';

class ParentRepositoryImpl implements ParentRepository {
  final ParentDao _parentDao;

  const ParentRepositoryImpl({required ParentDao parentDao})
      : _parentDao = parentDao;

  @override
  Future<Parent> createParent(Parent parent) async {
    return _parentDao.createParent(parent);
  }

  @override
  Future<void> deleteParent(int mainPersonID, int parentID) async {
    return _parentDao.deleteParent(mainPersonID, parentID);
  }

  @override
  Future<List<Parent>> getAllActiveParents(int mainPersonID) async {
    return _parentDao.getAllActiveParents(mainPersonID);
  }

  @override
  Future<Parent?> getParent(int mainPersonID, int parentID) async {
    return _parentDao.getParent(mainPersonID, parentID);
  }

  @override
  Future<void> updateParent(Parent parent) async {
    return _parentDao.updateParent(parent);
  }

  @override
  Stream<Parent?> watchParent(int mainPersonID, int parentID) {
    return _parentDao.watchParent(mainPersonID, parentID);
  }

  @override
  Stream<List<Parent>> watchAllActiveParents(int mainPersonID) {
    return _parentDao.watchAllActiveParents(mainPersonID);
  }
}
