import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';

class WatchPersonUsecase {
  final PersonRepository _personRepository;

  const WatchPersonUsecase({
    required PersonRepository personRepository,
  }) : _personRepository = personRepository;

  Stream<Person?> execute({required int personID}) {
    return _personRepository.watchPerson(personID);
  }
}
