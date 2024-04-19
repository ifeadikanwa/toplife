import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/appearance_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/appearance.dart';

part 'appearance_dao_impl.g.dart';

@DriftAccessor(tables: [AppearanceTable])
class AppearanceDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$AppearanceDaoImplMixin
    implements AppearanceDao {
  AppearanceDaoImpl(super.database);

  @override
  Future<Appearance> createOrUpdateAppearance(
    Appearance appearance,
  ) async {
    //I use insert with a replace mode because insertOnConflictUpdate
    //does not recognize unique contraints that aren't primary keys.
    //This table has no primary key, only a UNIQUE column
    await into(appearanceTable).insert(
      appearance,
      mode: InsertMode.insertOrReplace,
    );
    return appearance;
  }

  @override
  Future<void> deleteAppearance(int personID) {
    return (delete(appearanceTable)
          ..where(
            (appearance) => appearance.personId.equals(personID),
          ))
        .go();
  }

  @override
  Future<Appearance?> getAppearance(int personID) {
    return (select(appearanceTable)
          ..where((appearance) => appearance.personId.equals(personID))
          ..limit(1))
        .getSingleOrNull();
  }
}
