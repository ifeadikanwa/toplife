import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/parent_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/parent.dart';

part 'parent_dao_impl.g.dart';

@DriftAccessor(tables: [ParentTable])
class ParentDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$ParentDaoImplMixin
    implements ParentDao {
  ParentDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Parent> createParent(Parent parent) async {
    await into(parentTable).insertOnConflictUpdate(parent);
    return parent;
  }

  @override
  Future<void> deleteParent(int mainPersonID, int parentID) {
    return (delete(parentTable)
          ..where(
            (parent) =>
                parent.mainPersonId.equals(mainPersonID) &
                parent.parentId.equals(parentID),
          ))
        .go();
  }

  @override
  Future<List<Parent>> getAllActiveParents(int mainPersonID) {
    return (select(parentTable)
          ..where(
            (parent) =>
                parent.mainPersonId.equals(mainPersonID) &
                parent.isActive.equals(true),
          ))
        .get();
  }

  @override
  Future<Parent?> getParent(int mainPersonID, int parentID) {
    return (select(parentTable)
          ..where(
            (parent) =>
                parent.mainPersonId.equals(mainPersonID) &
                parent.parentId.equals(parentID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateParent(Parent parent) {
    return update(parentTable).replace(parent);
  }

  @override
  Stream<Parent?> watchParent(int mainPersonID, int parentID) {
    return (select(parentTable)
          ..where(
            (parent) =>
                parent.mainPersonId.equals(mainPersonID) &
                parent.parentId.equals(parentID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<Parent>> watchAllActiveParents(int mainPersonID) {
    return (select(parentTable)
          ..where(
            (parent) =>
                parent.mainPersonId.equals(mainPersonID) &
                parent.isActive.equals(true),
          ))
        .watch();
  }
}
