import 'package:toplife/main_systems/system_person/domain/model/person.dart';
import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/person_repository.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class UpdateIntellectStatsUsecase {
  final StatsRepository _statsRepository;

  const UpdateIntellectStatsUsecase({
    required StatsRepository statsRepository,
  }) : _statsRepository = statsRepository;

  Future<void> execute({
    required int mainPersonID,
    required int change,
  }) async {
    final Stats? stats = await _statsRepository.getStats(mainPersonID);
    if (stats != null) {
      final int oldIntellect = stats.intellect;
      _statsRepository.updateStats(
        stats.copyWith(
          intellect: oldIntellect + change,
        ),
      );
    }
  }
}
