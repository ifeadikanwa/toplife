import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/dao/jewelry_dao.dart';
import 'package:toplife/main_systems/system_shop_and_storage/domain/model/jewelry.dart';

part 'jewelry_dao_impl.g.dart';

@DriftAccessor(tables: [JewelryTable])
class JewelryDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$JewelryDaoImplMixin
    implements JewelryDao {
  JewelryDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Jewelry> createJewelry(Jewelry jewelry) async {
    final JewelryTableCompanion jewelryWithoutID =
        jewelry.toCompanion(false).copyWith(id: const Value.absent());

    final jewelryID =
        await into(jewelryTable).insertOnConflictUpdate(jewelryWithoutID);
    return jewelry.copyWith(id: jewelryID);
  }

  @override
  Future<void> deleteJewelry(int jewelryID) {
    return (delete(jewelryTable)
          ..where((jewelry) => jewelry.id.equals(jewelryID)))
        .go();
  }

  @override
  Future<List<Jewelry>> getAllJewelry(int personID) {
    return (select(jewelryTable)
          ..where(
            (jewelry) => jewelry.personId.equals(personID),
          ))
        .get();
  }

  @override
  Future<Jewelry?> getJewelry(int jewelryID) {
    return (select(jewelryTable)
          ..where((jewelry) => jewelry.id.equals(jewelryID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateJewelry(Jewelry jewelry) {
    return update(jewelryTable).replace(jewelry);
  }

  @override
  Stream<List<Jewelry>> watchAllJewelry(int personID) {
    return (select(jewelryTable)
          ..where(
            (jewelry) => jewelry.personId.equals(personID),
          ))
        .watch();
  }

  @override
  Stream<Jewelry?> watchJewelry(int jewelryID) {
    return (select(jewelryTable)
          ..where((jewelry) => jewelry.id.equals(jewelryID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
