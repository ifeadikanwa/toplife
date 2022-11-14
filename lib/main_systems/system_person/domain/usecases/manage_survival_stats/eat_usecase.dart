import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class EatUsecase {
  final StatsRepository _statsRepository;

  const EatUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({required int personID, required int food}) async {
    final personStats = await _statsRepository.getStats(personID);
    if (personStats != null) {
      
      final updatedHungerStat = personStats.hunger + food;

      _statsRepository.updateStats(personStats.copyWith(
        hunger: updatedHungerStat,
      ));
    }
  }
}
