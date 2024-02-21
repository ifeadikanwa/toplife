import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class PersonDao {
  Future<Person> createPerson(Person person);

  Future<Person?> getPerson(int personID);

  Future<void> updatePerson(Person person);

  Future<void> deletePerson(int personID);

  Future<List<Person>> getLivingPeopleInASpecifiedAgeRange({
    required int minDayOfBirth,
    required int maxDayOfBirth,
  });

  Future<List<Person>> getLivingPeopleInASpecifiedAgeRangeAndCountry({
    required int minDayOfBirth,
    required int maxDayOfBirth,
    required String countryString,
  });

  Stream<Person?> watchPerson(int personID);
}
