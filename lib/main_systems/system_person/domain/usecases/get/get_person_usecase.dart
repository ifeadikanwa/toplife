import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';

class GetPersonUsecase {
  final PersonRepository _personRepository;

  const GetPersonUsecase({
    required PersonRepository personRepository,
  }) : _personRepository = personRepository;

  Future<Person?> execute({required int personID}) async {
    return await _personRepository.getPerson(personID);
  }
}
