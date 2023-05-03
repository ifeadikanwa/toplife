import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class DepleteMainPlayerEnergyUsecase {
  final StatsRepository _statsRepository;

  const DepleteMainPlayerEnergyUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int personID,
    required double hours,
  }) async {
    final personStats = await _statsRepository.getStats(personID);
    if (personStats != null) {
      final currentEnergyStat = personStats.energy;

      double depletedEnergy = 0;
      int updatedEnergyStat = 0;

      if (currentEnergyStat <= StatsConstants.energyEmergencyModeStat) {
        //Handle depletion with emergency mode
        depletedEnergy = getEmergencyDepletionValue(hours);
        updatedEnergyStat = (currentEnergyStat - depletedEnergy).floor();
      } else {
        //Handle the depletion regular mode
        depletedEnergy = getRegularDepletionValue(hours);

        //If the regular depletion is going to cause the energy stat to be less than or equal to the emergency mode stat,
        //then just update to enter emergency mode.
        //or else do a regular depletion update
        if ((currentEnergyStat - depletedEnergy) <=
            StatsConstants.energyEmergencyModeStat) {
          updatedEnergyStat = StatsConstants.energyEmergencyModeStat;
        } else {
          updatedEnergyStat = (currentEnergyStat - depletedEnergy).floor();
        }
      }

      final updatedPersonStats = personStats.copyWith(
        energy: crossCheckStat(updatedEnergyStat),
      );

      _statsRepository.updateStats(updatedPersonStats);
    }
  }

  double getEmergencyDepletionValue(double hours) {
    return hours * StatsConstants.energyEmergencyDepletionRatePerHour;
  }

  double getRegularDepletionValue(double hours) {
    return hours * StatsConstants.energyDepletionRatePerHour;
  }
}
