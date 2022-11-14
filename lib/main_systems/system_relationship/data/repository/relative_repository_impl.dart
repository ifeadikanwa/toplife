import 'package:toplife/main_systems/system_relationship/domain/dao/relative_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relative.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/relative_repository.dart';

class RelativeRepositoryImpl implements RelativeRepository {
  final RelativeDao _relativeDao;

  const RelativeRepositoryImpl({required RelativeDao relativeDao})
      : _relativeDao = relativeDao;

  @override
  Future<Relative> createRelative(Relative relative) async {
    return _relativeDao.createRelative(relative);
  }

  @override
  Future<void> deleteRelative(int mainPersonID, int relativeID) async {
    return _relativeDao.deleteRelative(mainPersonID, relativeID);
  }

  @override
  Future<List<Relative>> getAllRelatives(int mainPersonID) async {
    return _relativeDao.getAllRelatives(mainPersonID);
  }

  @override
  Future<Relative?> getRelative(int mainPersonID, int relativeID) async {
    return _relativeDao.getRelative(mainPersonID, relativeID);
  }

  @override
  Future<void> updateRelative(Relative relative) async {
    return _relativeDao.updateRelative(relative);
  }

  @override
  Future<List<Relative>> getAllGrandchildren(int mainPersonID) async {
    return _relativeDao.getAllGrandchildren(mainPersonID);
  }

  @override
  Future<List<Relative>> getAllNiblings(int mainPersonID) async {
    return _relativeDao.getAllNiblings(mainPersonID);
  }

  @override
  Future<List<Relative>> getAllPiblings(int mainPersonID) {
    return _relativeDao.getAllPiblings(mainPersonID);
  }
}
