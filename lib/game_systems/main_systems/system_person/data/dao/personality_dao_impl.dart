import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/dao/personality_dao.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/model/personality.dart';

part 'personality_dao_impl.g.dart';

@DriftAccessor(tables: [PersonalityTable])
class PersonalityDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$PersonalityDaoImplMixin
    implements PersonalityDao {
  PersonalityDaoImpl(super.database);

  @override
  Future<Personality> createOrUpdatePersonality(
    Personality personality,
  ) async {
    //I use insert with a replace mode because insertOnConflictUpdate
    //does not recognize unique contraints that aren't primary keys.
    //This table has no primary key, only a UNIQUE column
    await into(personalityTable)
        .insert(personality, mode: InsertMode.insertOrReplace);
    return personality;
  }

  @override
  Future<void> deletePersonality(int personID) {
    return (delete(personalityTable)
          ..where(
            (personality) => personality.personId.equals(personID),
          ))
        .go();
  }

  @override
  Future<Personality?> getPersonality(int personID) {
    return (select(personalityTable)
          ..where((personality) => personality.personId.equals(personID))
          ..limit(1))
        .getSingleOrNull();
  }
}
