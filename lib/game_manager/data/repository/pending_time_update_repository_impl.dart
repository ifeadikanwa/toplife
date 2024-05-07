import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_manager/domain/dao/pending_time_update_dao.dart';
import 'package:toplife/game_manager/domain/repository/pending_time_update_repository.dart';

class PendingTimeUpdateRepositoryImpl implements PendingTimeUpdateRepository {
  final PendingTimeUpdateDao _pendingTimeUpdateDao;

  const PendingTimeUpdateRepositoryImpl(
      PendingTimeUpdateDao pendingTimeUpdateDao)
      : _pendingTimeUpdateDao = pendingTimeUpdateDao;

  @override
  Future<PendingTimeUpdate> createOrUpdatePendingTimeUpdate(
    PendingTimeUpdate pendingTimeUpdate,
  ) async {
    return _pendingTimeUpdateDao
        .createOrUpdatePendingTimeUpdate(pendingTimeUpdate);
  }

  @override
  Future<void> deletePendingTimeUpdate(int gameId) async {
    return _pendingTimeUpdateDao.deletePendingTimeUpdate(gameId);
  }

  @override
  Future<PendingTimeUpdate?> getPendingTimeUpdate(int gameId) async {
    return _pendingTimeUpdateDao.getPendingTimeUpdate(gameId);
  }

  @override
  Future<List<PendingTimeUpdate>> getAllPendingTimeUpdates() async {
    return _pendingTimeUpdateDao.getAllPendingTimeUpdates();
  }
}
