import 'package:toplife/main_systems/system_person/domain/model/person.dart';

abstract class PersonDao {
  Future<Person> createPerson(Person person);
  Future<Person?> getPerson(int personID);
  Future<void> updatePerson(Person person);
  Future<void> deletePerson(int personID);
}
