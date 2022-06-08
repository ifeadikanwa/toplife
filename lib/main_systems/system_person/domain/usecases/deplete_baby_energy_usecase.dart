import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class DepleteBabyEnergyUsecase {
  final StatsRepository _statsRepository;

  const DepleteBabyEnergyUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int personID,
    required int hours,
  }) async {
    final babyStats = await _statsRepository.getStats(personID);

    if (babyStats != null) {
      final int currentEnergyStat = babyStats.energy;

      int depletedEnergy = 0;
      int updatedEnergyStat = 0;

      if (currentEnergyStat <= Stats.babyEnergyEmergencyModeStat) {
        //Handle depletion with emergency mode
        depletedEnergy = getEmergencyDepletionValue(hours);
        updatedEnergyStat = currentEnergyStat - depletedEnergy;
      } else {
        //Handle the depletion regular mode
        depletedEnergy = getRegularDepletionValue(hours);

        //If the regular depletion is going to cause the energy stat to be less than or equal to the emergency mode stat,
        //then just update to enter emergency mode.
        //or else do a regular depletion update
        if ((currentEnergyStat - depletedEnergy) <=
            Stats.babyEnergyEmergencyModeStat) {
          updatedEnergyStat = Stats.babyEnergyEmergencyModeStat;
        } else {
          updatedEnergyStat = currentEnergyStat - depletedEnergy;
        }
      }

      final updatedBabyStats = babyStats.copyWith(energy: updatedEnergyStat);

      _statsRepository.updateStats(updatedBabyStats);
    }
  }

  int getEmergencyDepletionValue(int hours) {
    return hours * Stats.babyEnergyEmergencyDepletionRatePerHour;
  }

  int getRegularDepletionValue(int hours) {
    return hours * Stats.babyEnergyDepletionRatePerHour;
  }
}
