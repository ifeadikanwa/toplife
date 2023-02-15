import 'package:toplife/main_systems/system_person/constants/stats_constants.dart';
import 'package:toplife/main_systems/system_person/domain/repository/baby_traits_repository.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class DepleteBabyHungerUsecase {
  final StatsRepository _statsRepository;
  final BabyTraitsRepository _babyTraitsRepository;

  const DepleteBabyHungerUsecase({
    required StatsRepository statsRepository,
    required BabyTraitsRepository babyTraitsRepository,
  })  : _statsRepository = statsRepository,
        _babyTraitsRepository = babyTraitsRepository;

  Future<void> execute({
    required int personID,
    required int hours,
  }) async {
    final babyTraits = await _babyTraitsRepository.getBabyTraits(personID);
    final babyStats = await _statsRepository.getStats(personID);

    if (babyTraits != null && babyStats != null) {
      final int currentHungerStat = babyStats.hunger;
      final int appetite = babyTraits.appetite;

      int updatedHungerStat = 0;
      int depletedHunger = 0;

      if (currentHungerStat <= StatsConstants.babyHungerEmergencyModeStat) {
        depletedHunger = getEmergencyDepletionValue(hours);
        updatedHungerStat = currentHungerStat - depletedHunger;
      } else {
        depletedHunger = getRegularDepletionValue(hours, appetite);

        if ((currentHungerStat - depletedHunger) <=
            StatsConstants.babyHungerEmergencyModeStat) {
          updatedHungerStat = StatsConstants.babyHungerEmergencyModeStat;
        } else {
          updatedHungerStat = currentHungerStat - depletedHunger;
        }
      }

      final updatedBabyStats = babyStats.copyWith(hunger: updatedHungerStat);

      _statsRepository.updateStats(updatedBabyStats);
    }
  }

  int getEmergencyDepletionValue(int hours) {
    return hours * StatsConstants.babyHungerEmergencyDepletionRatePerHour;
  }

  int getRegularDepletionValue(int hours, int appetite) {
    int depletionRatePerHour = (100 ~/ appetite) - 5;
    return hours * depletionRatePerHour;
  }
}
