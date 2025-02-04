import 'package:toplife/game_systems/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/stats_repository.dart';

class DepleteMainPlayerAthleticismUsecase {
  final StatsRepository _statsRepository;

  const DepleteMainPlayerAthleticismUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int personID,
    required double hours,
  }) async {
    final personStats = await _statsRepository.getStats(personID);
    if (personStats != null) {
      final double depletedAthleticism =
          hours * StatsConstants.athleticismDepletionRatePerHour;

      final int updatedAthleticism =
          (personStats.athleticism - depletedAthleticism).floor();

      final updatedPersonStats = personStats.copyWith(
        athleticism: updatedAthleticism,
      );

      await _statsRepository.updateStats(updatedPersonStats);
    }
  }
}
