import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/child_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/child_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/child.dart';

part 'child_dao_impl.g.dart';

@DriftAccessor(tables: [ChildTable])
class ChildDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$ChildDaoImplMixin
    implements ChildDao {
  ChildDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Child> createChild(Child child) async {
    await into(childTable).insertOnConflictUpdate(child);
    return child;
  }

  @override
  Future<void> deleteAllStepChildren(int mainPersonID) {
    return (delete(childTable)
          ..where(
            (child) =>
                child.mainPersonId.equals(mainPersonID) &
                child.childRelationshipType
                    .equals(ChildRelationshipType.step.name),
          ))
        .go();
  }

  @override
  Future<void> deleteChild(int mainPersonID, int childID) {
    return (delete(childTable)
          ..where(
            (child) =>
                child.mainPersonId.equals(mainPersonID) &
                child.childId.equals(childID),
          ))
        .go();
  }

  @override
  Future<List<Child>> getAllChildren(int mainPersonID) {
    return (select(childTable)
          ..where(
            (child) => child.mainPersonId.equals(mainPersonID),
          ))
        .get();
  }

  @override
  Future<Child?> getChild(int mainPersonID, int childID) {
    return (select(childTable)
          ..where(
            (child) =>
                child.mainPersonId.equals(mainPersonID) &
                child.childId.equals(childID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateChild(Child child) {
    return update(childTable).replace(child);
  }

  @override
  Stream<Child?> watchChild(int mainPersonID, int childID) {
    return (select(childTable)
          ..where(
            (child) =>
                child.mainPersonId.equals(mainPersonID) &
                child.childId.equals(childID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<Child>> watchAllChildren(int mainPersonID) {
    return (select(childTable)
          ..where(
            (child) => child.mainPersonId.equals(mainPersonID),
          ))
        .watch();
  }
}
