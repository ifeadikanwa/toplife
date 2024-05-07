import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class PendingTimeUpdateDao {
  Future<PendingTimeUpdate> createOrUpdatePendingTimeUpdate(
      PendingTimeUpdate pendingTimeUpdate);

  Future<void> deletePendingTimeUpdate(int gameId);

  Future<PendingTimeUpdate?> getPendingTimeUpdate(int gameId);

  Future<List<PendingTimeUpdate>> getAllPendingTimeUpdates();
}
