import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class DepleteBabyEnergyUsecase {
  final StatsRepository _statsRepository;

  const DepleteBabyEnergyUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int personID,
    required double hours,
  }) async {
    final babyStats = await _statsRepository.getStats(personID);

    if (babyStats != null) {
      final int currentEnergyStat = babyStats.energy;

      double depletedEnergy = 0;
      int updatedEnergyStat = 0;

      if (currentEnergyStat <= StatsConstants.babyEnergyEmergencyModeStat) {
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
            StatsConstants.babyEnergyEmergencyModeStat) {
          updatedEnergyStat = StatsConstants.babyEnergyEmergencyModeStat;
        } else {
          updatedEnergyStat = (currentEnergyStat - depletedEnergy).floor();
        }
      }

      final updatedBabyStats = babyStats.copyWith(energy: updatedEnergyStat);

      _statsRepository.updateStats(updatedBabyStats);
    }
  }

  double getEmergencyDepletionValue(double hours) {
    return hours * StatsConstants.babyEnergyEmergencyDepletionRatePerHour;
  }

  double getRegularDepletionValue(double hours) {
    return hours * StatsConstants.babyEnergyDepletionRatePerHour;
  }
}
