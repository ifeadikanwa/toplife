import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class DepleteMainPlayerHungerUsecase {
  final StatsRepository _statsRepository;

  const DepleteMainPlayerHungerUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int personID,
    required double hours,
  }) async {
    final personStats = await _statsRepository.getStats(personID);
    if (personStats != null) {
      final currentHungerStat = personStats.hunger;

      double depletedHunger = 0;
      int updatedHungerStat = 0;

      if (currentHungerStat <= StatsConstants.hungerEmergencyModeStat) {
        //Handle depletion with emergency mode
        depletedHunger = getEmergencyDepletionValue(hours);
        updatedHungerStat = (currentHungerStat - depletedHunger).floor();
      } else {
        //Handle the depletion regular mode
        depletedHunger = getRegularDepletionValue(hours);

        //If the regular depletion is going to cause the hunger stat to be less than or equal to the emergency mode stat,
        //then just update to enter emergency mode.
        //or else do a regular depletion update
        if ((currentHungerStat - depletedHunger) <=
            StatsConstants.hungerEmergencyModeStat) {
        
          updatedHungerStat = StatsConstants.hungerEmergencyModeStat;
        } else {
          updatedHungerStat = (currentHungerStat - depletedHunger).floor();
        }
      }
      
      final updatedPersonStats = personStats.copyWith(
        hunger: crossCheckStat(updatedHungerStat),
      );

      _statsRepository.updateStats(updatedPersonStats);
    }
  }

  double getEmergencyDepletionValue(double hours) {
    return hours * StatsConstants.hungerEmergencyDepletionRatePerHour;
  }

  double getRegularDepletionValue(double hours) {
    return hours * StatsConstants.hungerDepletionRatePerHour;
  }
}
