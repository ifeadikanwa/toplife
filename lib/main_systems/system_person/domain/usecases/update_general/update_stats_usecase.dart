import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class UpdateStatsUsecase {
  final StatsRepository _statsRepository;

  const UpdateStatsUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({required Stats stats}) async {
    return _statsRepository.updateStats(stats);
  }
}
