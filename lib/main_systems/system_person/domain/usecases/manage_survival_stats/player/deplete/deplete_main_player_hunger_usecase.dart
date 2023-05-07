import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';
import 'package:toplife/main_systems/system_person/domain/usecases/manage_survival_stats/player/side_effects/energy_and_hunger_emergency_mode_side_effects_usecase.dart';

class DepleteMainPlayerHungerUsecase {
  final StatsRepository _statsRepository;
  final EnergyAndHungerEmergencyModeSideEffectUsecase
      _energyAndHungerEmergencyModeSideEffectUsecase;

  const DepleteMainPlayerHungerUsecase({
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
      final currentHungerStat = personStats.hunger;

      double depletedHunger = 0;
      int updatedHungerStat = 0;

      //Emergency Mode
      if (currentHungerStat <= StatsConstants.hungerEmergencyModeStat) {
        //Handle depletion with emergency mode
        depletedHunger = getEmergencyDepletionValue(hours);
        updatedHungerStat = (currentHungerStat - depletedHunger).floor();

        final updatedPersonStats = personStats.copyWith(
          hunger: crossCheckStat(updatedHungerStat),
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

        final updatedPersonStats = personStats.copyWith(
          hunger: crossCheckStat(updatedHungerStat),
        );

        await _statsRepository.updateStats(updatedPersonStats);
      }
    }
  }

  double getEmergencyDepletionValue(double hours) {
    return hours * StatsConstants.hungerEmergencyDepletionRatePerHour;
  }

  double getRegularDepletionValue(double hours) {
    return hours * StatsConstants.hungerDepletionRatePerHour;
  }
}
