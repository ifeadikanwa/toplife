import 'package:toplife/main_systems/system_person/domain/dao/person_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/person.dart';
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
}
