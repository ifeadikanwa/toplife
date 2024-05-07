import 'package:toplife/game_systems/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/stats_repository.dart';

class DepleteMainPlayerHealthUsecase {
  final StatsRepository _statsRepository;

  const DepleteMainPlayerHealthUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int personID,
    required double hours,
  }) async {
    final personStats = await _statsRepository.getStats(personID);
    if (personStats != null) {
      //Natural depletion with time should not happen if health is less than the threshold
      //This is so we can save stats for actual illnesses to have effect

      if (personStats.health > StatsConstants.healthDepletionThreshold) {
        final double depletedHealth =
            hours * StatsConstants.healthDepletionRatePerHour;

        final int updatedHealth = (personStats.health - depletedHealth).floor();

        final updatedPersonStats = personStats.copyWith(
          health: updatedHealth,
        );

        await _statsRepository.updateStats(updatedPersonStats);
      }
    }
  }
}
