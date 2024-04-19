import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/parent_child_link_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent_child_link.dart';

part 'parent_child_link_dao_impl.g.dart';

@DriftAccessor(tables: [ParentChildLinkTable])
class ParentChildLinkDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$ParentChildLinkDaoImplMixin
    implements ParentChildLinkDao {
  ParentChildLinkDaoImpl(super.database);

  @override
  Future<ParentChildLink> createParentChildLink(
    ParentChildLink parentChildLink,
  ) async {
    await into(parentChildLinkTable).insertOnConflictUpdate(parentChildLink);
    return parentChildLink;
  }

  @override
  Future<void> deleteParentChildLink(
    int parentID,
    int childID,
  ) {
    return (delete(parentChildLinkTable)
          ..where(
            (parentChildLink) =>
                parentChildLink.parentId.equals(parentID) &
                parentChildLink.childId.equals(childID),
          ))
        .go();
  }

  @override
  Future<List<ParentChildLink>> getAllChildrenOfParent(int parentID) {
    return (select(parentChildLinkTable)
          ..where(
            (parentChildLink) => parentChildLink.parentId.equals(parentID),
          ))
        .get();
  }

  @override
  Future<List<ParentChildLink>> getAllParentsOfChild(int childID) {
    return (select(parentChildLinkTable)
          ..where(
            (parentChildLink) => parentChildLink.childId.equals(childID),
          ))
        .get();
  }

  @override
  Future<ParentChildLink?> getParentChildLink(
    int parentID,
    int childID,
  ) {
    return (select(parentChildLinkTable)
          ..where(
            (parentChildLink) =>
                parentChildLink.parentId.equals(parentID) &
                parentChildLink.childId.equals(childID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateParentChildLink(ParentChildLink parentChildLink) {
    return update(parentChildLinkTable).replace(parentChildLink);
  }
}
