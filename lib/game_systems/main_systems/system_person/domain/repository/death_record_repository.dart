import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class DeathRecordRepository {
  Future<DeathRecord> createOrUpdateDeathRecord(DeathRecord deathRecord);
  Future<DeathRecord?> getDeathRecord(int gameID, int personID);
  Future<void> deleteDeathRecord(int gameID, int personID);
}
