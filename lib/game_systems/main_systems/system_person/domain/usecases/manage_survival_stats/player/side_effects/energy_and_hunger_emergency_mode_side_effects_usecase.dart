import 'package:toplife/game_systems/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/stats_repository.dart';

class EnergyAndHungerEmergencyModeSideEffectUsecase {
  final StatsRepository _statsRepository;

  const EnergyAndHungerEmergencyModeSideEffectUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int personID,
    required double hours,
  }) async {
    final personStats = await _statsRepository.getStats(personID);

    if (personStats != null) {
      //*Create relevant health problems? (like migraine, fatigue)
      //

      //We decrease some stats
      final double intellectDecrease = hours *
          StatsConstants.emergencyModeIntellectSideEffectDepletionRatePerHour;

      final double looksDecrease = hours *
          StatsConstants.emergencyModeLooksSideEffectDepletionRatePerHour;

      final double athleticismDecrease = hours *
          StatsConstants.emergencyModeAthleticismSideEffectDepletionRatePerHour;

      final int updatedIntellect =
          (personStats.intellect - intellectDecrease).floor();

      final int updatedLooks = (personStats.looks - looksDecrease).floor();

      final int updatedAthleticism =
          (personStats.athleticism - athleticismDecrease).floor();

      final updatedPersonStats = personStats.copyWith(
        intellect: updatedIntellect,
        looks: updatedLooks,
        athleticism: updatedAthleticism,
      );
      await _statsRepository.updateStats(updatedPersonStats);
    }
  }
}
