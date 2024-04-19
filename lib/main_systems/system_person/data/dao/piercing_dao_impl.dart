import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/piercing_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/piercing.dart';

part 'piercing_dao_impl.g.dart';

@DriftAccessor(tables: [PiercingTable])
class PiercingDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$PiercingDaoImplMixin
    implements PiercingDao {
  PiercingDaoImpl(super.database);

  @override
  Future<Piercing> createPiercing(Piercing piercing) async {
    final PiercingTableCompanion piercingWithoutID =
        piercing.toCompanion(false).copyWith(
              id: const Value.absent(),
            );
    final piercingID = await into(piercingTable).insertOnConflictUpdate(
      piercingWithoutID,
    );
    return piercing.copyWith(id: piercingID);
  }

  @override
  Future<void> deletePiercing(int piercingID) {
    return (delete(piercingTable)
          ..where(
            (piercing) => piercing.id.equals(piercingID),
          ))
        .go();
  }

  @override
  Future<List<Piercing>> getAllPiercings(int personID) {
    return (select(piercingTable)
          ..where((piercing) => piercing.personId.equals(personID)))
        .get();
  }

  @override
  Future<Piercing?> getPiercing(int piercingID) {
    return (select(piercingTable)
          ..where((piercing) => piercing.id.equals(piercingID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updatePiercing(Piercing piercing) {
    return update(piercingTable).replace(piercing);
  }
}
