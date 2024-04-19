import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/tattoo_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/tattoo.dart';

part 'tattoo_dao_impl.g.dart';

@DriftAccessor(tables: [TattooTable])
class TattooDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$TattooDaoImplMixin
    implements TattooDao {
  TattooDaoImpl(super.database);

  @override
  Future<Tattoo> createTattoo(Tattoo tattoo) async {
    final TattooTableCompanion tattooWithoutID =
        tattoo.toCompanion(false).copyWith(
              id: const Value.absent(),
            );
    final tattooID = await into(tattooTable).insertOnConflictUpdate(
      tattooWithoutID,
    );
    return tattoo.copyWith(id: tattooID);
  }

  @override
  Future<void> deleteTattoo(int tattooID) {
    return (delete(tattooTable)
          ..where(
            (tattoo) => tattoo.id.equals(tattooID),
          ))
        .go();
  }

  @override
  Future<List<Tattoo>> getAllTattoos(int personID) {
    return (select(tattooTable)
          ..where((tattoo) => tattoo.personId.equals(personID)))
        .get();
  }

  @override
  Future<Tattoo?> getTattoo(int tattooID) {
    return (select(tattooTable)
          ..where((tattoo) => tattoo.id.equals(tattooID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateTattoo(Tattoo tattoo) {
    return update(tattooTable).replace(tattoo);
  }
}
