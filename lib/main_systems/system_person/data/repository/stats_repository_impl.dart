import 'package:toplife/main_systems/system_person/domain/dao/stats_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/stats.dart';
import 'package:toplife/main_systems/system_person/domain/repository/stats_repository.dart';

class StatsRepositoryImpl implements StatsRepository {
  final StatsDao _statsDao;

  const StatsRepositoryImpl({required StatsDao statsDao})
      : _statsDao = statsDao;

  @override
  Future<Stats> createStats(Stats stats) async {
    return _statsDao.createStats(stats);
  }

  @override
  Future<void> deleteStats(int statsID) async {
    return _statsDao.deleteStats(statsID);
  }

  @override
  Future<Stats?> getStats(int personID) async {
    return _statsDao.getStats(personID);
  }

  @override
  Future<void> updateStats(Stats stats) async {
    return _statsDao.updateStats(stats);
  }
}
