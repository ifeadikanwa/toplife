import 'package:toplife/main_systems/system_relationship/domain/dao/parent_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/parent_repository.dart';

class ParentRepositoryImpl implements ParentRepository {
  final ParentDao _parentDao;

  const ParentRepositoryImpl({required ParentDao parentDao}) : _parentDao = parentDao;

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
}
