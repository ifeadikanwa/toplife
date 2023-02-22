import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/sibling_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/sibling.dart';

part 'sibling_dao_impl.g.dart';

@DriftAccessor(tables: [SiblingTable])
class SiblingDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$SiblingDaoImplMixin
    implements SiblingDao {
  SiblingDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Sibling> createSibling(Sibling sibling) async {
    await into(siblingTable).insertOnConflictUpdate(sibling);
    return sibling;
  }

  @override
  Future<void> deleteSibling(int mainPersonID, int siblingID) {
    return (delete(siblingTable)
          ..where(
            (sibling) =>
                sibling.mainPersonId.equals(mainPersonID) &
                sibling.siblingId.equals(siblingID),
          ))
        .go();
  }

  @override
  Future<List<Sibling>> getAllSiblings(int mainPersonID) {
    return (select(siblingTable)
          ..where(
            (sibling) => sibling.mainPersonId.equals(mainPersonID),
          ))
        .get();
  }

  @override
  Future<Sibling?> getSibling(int mainPersonID, int siblingID) {
    return (select(siblingTable)
          ..where(
            (sibling) =>
                sibling.mainPersonId.equals(mainPersonID) &
                sibling.siblingId.equals(siblingID),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateSibling(Sibling sibling) {
    return update(siblingTable).replace(sibling);
  }

  @override
  Stream<Sibling?> watchSibling(int mainPersonID, int siblingID) {
    return (select(siblingTable)
          ..where(
            (sibling) =>
                sibling.mainPersonId.equals(mainPersonID) &
                sibling.siblingId.equals(siblingID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Stream<List<Sibling>> watchAllSiblings(int mainPersonID) {
    return (select(siblingTable)
          ..where(
            (sibling) => sibling.mainPersonId.equals(mainPersonID),
          ))
        .watch();
  }
}
