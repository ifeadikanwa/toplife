import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class SleepUsecase {
  final PersonRepository _personRepository;
  final StatsRepository _statsRepository;

  const SleepUsecase({
    required PersonRepository personRepository,
    required StatsRepository statsRepository,
  })  : _personRepository = personRepository,
        _statsRepository = statsRepository;

  Future<void> execute(int personID, int hours) async {
    final person = await _personRepository.getPerson(personID);

    if (person != null) {
      final personStats = await _statsRepository.getStats(personID);

      personStats?.copyWith(energy: hours * 10);

      _statsRepository.updateStats(personStats!);
    }
  }
}
