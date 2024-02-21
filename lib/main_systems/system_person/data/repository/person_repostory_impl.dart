import 'package:toplife/main_systems/system_person/domain/dao/person_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonDao _personDao;

  const PersonRepositoryImpl({required PersonDao personDao})
      : _personDao = personDao;

  @override
  Future<Person> createPerson(Person person) async {
    return _personDao.createPerson(person);
  }

  @override
  Future<void> deletePerson(int personID) async {
    return _personDao.deletePerson(personID);
  }

  @override
  Future<Person?> getPerson(int personID) async {
    return _personDao.getPerson(personID);
  }

  @override
  Future<void> updatePerson(Person person) async {
    return _personDao.updatePerson(person);
  }

  @override
  Stream<Person?> watchPerson(int personID) {
    return _personDao.watchPerson(personID);
  }

  @override
  Future<List<Person>> getLivingPeopleInASpecifiedAgeRange({
    required int minDayOfBirth,
    required int maxDayOfBirth,
  }) {
    return _personDao.getLivingPeopleInASpecifiedAgeRange(
      minDayOfBirth: minDayOfBirth,
      maxDayOfBirth: maxDayOfBirth,
    );
  }

  @override
  Future<List<Person>> getLivingPeopleInASpecifiedAgeRangeAndCountry({
    required int minDayOfBirth,
    required int maxDayOfBirth,
    required String countryString,
  }) {
    return _personDao.getLivingPeopleInASpecifiedAgeRangeAndCountry(
      minDayOfBirth: minDayOfBirth,
      maxDayOfBirth: maxDayOfBirth,
      countryString: countryString,
    );
  }
}
