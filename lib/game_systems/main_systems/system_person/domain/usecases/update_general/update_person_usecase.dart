import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/person_repository.dart';

class UpdatePersonUsecase {
  final PersonRepository _personRepository;

  const UpdatePersonUsecase({
    required PersonRepository personRepository,
  }) : _personRepository = personRepository;

  Future<void> execute({required Person person}) async {
    return _personRepository.updatePerson(person);
  }
}
