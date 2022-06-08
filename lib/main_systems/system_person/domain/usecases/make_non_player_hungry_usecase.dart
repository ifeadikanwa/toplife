import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class MakeNonPlayerHungryUsecase {
  final StatsRepository _statsRepository;

  const MakeNonPlayerHungryUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({required int personID}) async {
    final personStats = await _statsRepository.getStats(personID);
    if (personStats != null) {

      final updatedPersonStats =
          personStats.copyWith(hunger: Stats.hungerEmergencyModeStat);

      _statsRepository.updateStats(updatedPersonStats);
    }
  }
}
