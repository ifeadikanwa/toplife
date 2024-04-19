import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/stance_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/stance.dart';

part 'stance_dao_impl.g.dart';

@DriftAccessor(tables: [StanceTable])
class StanceDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$StanceDaoImplMixin
    implements StanceDao {
  StanceDaoImpl(super.database);

  @override
  Future<Stance> createStance(Stance stance) async {
    final StanceTableCompanion stanceWithoutID =
        stance.toCompanion(false).copyWith(
              id: const Value.absent(),
            );
    final stanceID = await into(stanceTable).insertOnConflictUpdate(
      stanceWithoutID,
    );
    return stance.copyWith(id: stanceID);
  }

  @override
  Future<void> deleteStance(int stanceID) {
    return (delete(stanceTable)
          ..where(
            (stance) => stance.id.equals(stanceID),
          ))
        .go();
  }

  @override
  Future<Stance?> getStance(int personID) {
    return (select(stanceTable)
          ..where((stance) => stance.personId.equals(personID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateStance(Stance stance) {
    return update(stanceTable).replace(stance);
  }
}
