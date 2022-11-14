import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class DepleteMainPlayerEnergyUsecase {
  final StatsRepository _statsRepository;

  const DepleteMainPlayerEnergyUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({required int personID, required int hours}) async {
    final personStats = await _statsRepository.getStats(personID);
    if (personStats != null) {
      final currentEnergyStat = personStats.energy;

      int depletedEnergy = 0;
      int updatedEnergyStat = 0;

      if (currentEnergyStat <= Stats.energyEmergencyModeStat) {
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
            Stats.energyEmergencyModeStat) {
          updatedEnergyStat = Stats.energyEmergencyModeStat;
        } else {
          updatedEnergyStat = currentEnergyStat - depletedEnergy;
        }
      }

      final updatedPersonStats =  personStats.copyWith(energy: updatedEnergyStat);

      _statsRepository.updateStats(updatedPersonStats);
    }
  }

  int getEmergencyDepletionValue(int hours) {
    return hours * Stats.energyEmergencyDepletionRatePerHour;
  }

  int getRegularDepletionValue(int hours) {
    return hours * Stats.energyDepletionRatePerHour;
  }
}
