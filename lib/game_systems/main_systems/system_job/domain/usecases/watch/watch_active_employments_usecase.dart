import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_job/domain/repository/employment_repository.dart';

class WatchActiveEmploymentsUsecase {
  final EmploymentRepository _employmentRepository;

  const WatchActiveEmploymentsUsecase({
    required EmploymentRepository employmentRepository,
  }) : _employmentRepository = employmentRepository;

  Stream<List<Employment>> execute({required int personID}) {
    return _employmentRepository.watchAllActiveEmployments(personID);
  }
}
