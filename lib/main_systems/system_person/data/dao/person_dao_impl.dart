import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/person_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';

part 'person_dao_impl.g.dart';

@DriftAccessor(tables: [PersonTable])
class PersonDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$PersonDaoImplMixin
    implements PersonDao {
  PersonDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<Person> createPerson(Person person) async {
    final PersonTableCompanion personWithoutID =
        person.toCompanion(false).copyWith(id: const Value.absent());

    final personID =
        await into(personTable).insertOnConflictUpdate(personWithoutID);
    return person.copyWith(id: personID);
  }

  @override
  Future<void> deletePerson(int personID) {
    return (delete(personTable)..where((person) => person.id.equals(personID)))
        .go();
  }

  @override
  Future<Person?> getPerson(int personID) {
    return (select(personTable)
          ..where((person) => person.id.equals(personID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updatePerson(Person person) {
    return update(personTable).replace(person);
  }

  @override
  Stream<Person?> watchPerson(int personID) {
    return (select(personTable)
          ..where((person) => person.id.equals(personID))
          ..limit(1))
        .watchSingleOrNull();
  }
}
