import 'package:toplife/main_systems/system_relationship/domain/dao/child_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/child_repository.dart';

class ChildRepositoryImpl implements ChildRepository {
  final ChildDao _childDao;

  const ChildRepositoryImpl({required ChildDao childDao})
      : _childDao = childDao;

  @override
  Future<Child> createChild(Child child) async {
    return _childDao.createChild(child);
  }

  @override
  Future<void> deleteAllStepChildren(int mainPersonID) async {
    return _childDao.deleteAllStepChildren(mainPersonID);
  }

  @override
  Future<void> deleteChild(int mainPersonID, int childID) async {
    return _childDao.deleteChild(mainPersonID, childID);
  }

  @override
  Future<List<Child>> getAllChildren(int mainPersonID) async {
    return _childDao.getAllChildren(mainPersonID);
  }

  @override
  Future<Child?> getChild(int mainPersonID, int childID) async {
    return _childDao.getChild(mainPersonID, childID);
  }

  @override
  Future<void> updateChild(Child child) async {
    return _childDao.updateChild(child);
  }

  @override
  Stream<Child?> watchChild(int mainPersonID, int childID) {
    return _childDao.watchChild(mainPersonID, childID);
  }

  @override
  Stream<List<Child>> watchAllChildren(int mainPersonID) {
    return _childDao.watchAllChildren(mainPersonID);
  }
}
