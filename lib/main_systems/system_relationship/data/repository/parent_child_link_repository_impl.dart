import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/parent_child_link_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/parent_child_link_repository.dart';

class ParentChildLinkRepositoryImpl implements ParentChildLinkRepository {
  final ParentChildLinkDao _parentChildLinkDao;

  const ParentChildLinkRepositoryImpl({
    required ParentChildLinkDao parentChildLinkDao,
  }) : _parentChildLinkDao = parentChildLinkDao;

  @override
  Future<ParentChildLink> createParentChildLink(
      ParentChildLink parentChildLink) {
    return _parentChildLinkDao.createParentChildLink(parentChildLink);
  }

  @override
  Future<void> deleteParentChildLink(int parentID, int childID) {
    return _parentChildLinkDao.deleteParentChildLink(parentID, childID);
  }

  @override
  Future<List<ParentChildLink>> getAllChildrenOfParent(int parentID) {
    return _parentChildLinkDao.getAllChildrenOfParent(parentID);
  }

  @override
  Future<List<ParentChildLink>> getAllParentsOfChild(int childID) {
    return _parentChildLinkDao.getAllParentsOfChild(childID);
  }

  @override
  Future<ParentChildLink?> getParentChildLink(int parentID, int childID) {
    return _parentChildLinkDao.getParentChildLink(parentID, childID);
  }

  @override
  Future<void> updateParentChildLink(ParentChildLink parentChildLink) {
    return _parentChildLinkDao.updateParentChildLink(parentChildLink);
  }
}
