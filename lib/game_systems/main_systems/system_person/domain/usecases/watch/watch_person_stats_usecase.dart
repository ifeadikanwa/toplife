import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/stats_repository.dart';

class WatchPersonStatsUsecase {
  final StatsRepository _statsRepository;

  const WatchPersonStatsUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Stream<Stats?> execute({required int personID}) {
    return _statsRepository.watchStats(personID);
  }
}
