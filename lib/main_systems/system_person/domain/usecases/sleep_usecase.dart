import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class SleepUsecase {
  final StatsRepository _statsRepository;

  const SleepUsecase({
    required StatsRepository statsRepository,
  })  : _statsRepository = statsRepository;

Future<void> execute({required int personID, required int hours}) async {
    final personStats = await _statsRepository.getStats(personID);

    if (personStats != null) {
      final gainedEnergy = hours * 10;

      final updatedEnergyStat = personStats.energy + gainedEnergy;

      final updatedPersonStats =  personStats.copyWith(energy: updatedEnergyStat);

      _statsRepository.updateStats(updatedPersonStats);
    }
  }
}
