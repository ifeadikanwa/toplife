import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';

class DeletePersonUsecase {
  final PersonRepository _personRepository;

  const DeletePersonUsecase({
    required PersonRepository personRepository,
  }) : _personRepository = personRepository;

  Future<void> execute({required int personID}) async {
    _personRepository.deletePerson(personID);
  }
}
