import 'package:toplife/game_systems/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/usecases/manage_survival_stats/player/side_effects/energy_and_hunger_emergency_mode_side_effects_usecase.dart';

class DepleteMainPlayerEnergyUsecase {
  final StatsRepository _statsRepository;
  final EnergyAndHungerEmergencyModeSideEffectUsecase
      _energyAndHungerEmergencyModeSideEffectUsecase;

  const DepleteMainPlayerEnergyUsecase({
    required StatsRepository statsRepository,
    required EnergyAndHungerEmergencyModeSideEffectUsecase
        energyAndHungerEmergencyModeSideEffectUsecase,
  })  : _statsRepository = statsRepository,
        _energyAndHungerEmergencyModeSideEffectUsecase =
            energyAndHungerEmergencyModeSideEffectUsecase;

  Future<void> execute({
    required int personID,
    required double hours,
  }) async {
    final personStats = await _statsRepository.getStats(personID);
    if (personStats != null) {
      final currentEnergyStat = personStats.energy;

      double depletedEnergy = 0;
      int updatedEnergyStat = 0;

      //Emergency Mode
      if (currentEnergyStat <= StatsConstants.energyEmergencyModeStat) {
        //Handle depletion with emergency mode
        depletedEnergy = getEmergencyDepletionValue(hours);
        updatedEnergyStat = (currentEnergyStat - depletedEnergy).floor();

        final updatedPersonStats = personStats.copyWith(
          energy: updatedEnergyStat,
        );

        //we need to call this before the side effects if not our update will be overriden
        await _statsRepository.updateStats(updatedPersonStats);

        //apply side effects of emergency mode
        await _energyAndHungerEmergencyModeSideEffectUsecase.execute(
          personID: personID,
          hours: hours,
        );
      }
      //Regular Mode
      else {
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

        final updatedPersonStats = personStats.copyWith(
          energy: updatedEnergyStat,
        );

        await _statsRepository.updateStats(updatedPersonStats);
      }
    }
  }

  double getEmergencyDepletionValue(double hours) {
    return hours * StatsConstants.energyEmergencyDepletionRatePerHour;
  }

  double getRegularDepletionValue(double hours) {
    return hours * StatsConstants.energyDepletionRatePerHour;
  }
}
