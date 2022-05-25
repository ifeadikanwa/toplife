import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class EatUsecase {
  final PersonRepository _personRepository;
  final StatsRepository _statsRepository;

  const EatUsecase({
    required PersonRepository personRepository,
    required StatsRepository statsRepository,
  })  : _personRepository = personRepository,
        _statsRepository = statsRepository;

  Future<void> execute(int personID, int food) async {
    final person = await _personRepository.getPerson(personID);

    if (person != null) {
      final personStats = await _statsRepository.getStats(personID);

      personStats?.copyWith(hunger: food);

      _statsRepository.updateStats(personStats!);
    }
  }
}
