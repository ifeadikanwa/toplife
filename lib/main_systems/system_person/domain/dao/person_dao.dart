import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class PersonDao {
  Future<Person> createPerson(Person person);
  Future<Person?> getPerson(int personID);
  Future<void> updatePerson(Person person);
  Future<void> deletePerson(int personID);
  Stream<Person?> watchPerson(int personID);
}
