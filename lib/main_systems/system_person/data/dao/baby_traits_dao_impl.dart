import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/baby_traits_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/baby_traits.dart';

part 'baby_traits_dao_impl.g.dart';

@DriftAccessor(tables: [BabyTraitsTable])
class BabyTraitsDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$BabyTraitsDaoImplMixin
    implements BabyTraitsDao {
  BabyTraitsDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<BabyTraits> createBabyTraits(BabyTraits babyTraits) async {
    final BabyTraitsTableCompanion babyTraitsWithoutID =
        babyTraits.toCompanion(false).copyWith(
              id: const Value.absent(),
            );
    final babyTraitsID = await into(babyTraitsTable).insertOnConflictUpdate(
      babyTraitsWithoutID,
    );
    return babyTraits.copyWith(id: babyTraitsID);
  }

  @override
  Future<void> deleteBabyTraits(int babyTraitsID) {
    return (delete(babyTraitsTable)
          ..where(
            (babyTraits) => babyTraits.id.equals(babyTraitsID),
          ))
        .go();
  }

  @override
  Future<BabyTraits?> getBabyTraits(int personID)async {
   return (select(babyTraitsTable)
          ..where((babyTraits) => babyTraits.personId.equals(personID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateBabyTraits(BabyTraits babyTraits) {
    return update(babyTraitsTable).replace(babyTraits);
  }

  @override
  Stream<BabyTraits?> watchBabyTraits(int personID) {
    return (select(babyTraitsTable)
          ..where((babyTraits) => babyTraits.personId.equals(personID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
