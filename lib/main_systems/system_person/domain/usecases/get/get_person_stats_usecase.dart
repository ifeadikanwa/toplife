import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class GetPersonStatsUsecase {
  final StatsRepository _statsRepository;

  const GetPersonStatsUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<Stats?> execute(int personID) async {
    final Stats? stats = await _statsRepository.getStats(personID);

    return stats;
  }
}
