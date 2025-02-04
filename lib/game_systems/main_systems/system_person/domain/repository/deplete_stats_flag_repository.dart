import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class DepleteStatsFlagRepository {
  Future<DepleteStatsFlag> createOrUpdateDepleteStatsFlag(
      DepleteStatsFlag depleteStatsFlag);
  Future<DepleteStatsFlag?> getDepleteStatsFlag(int personID);
  Future<void> deleteDepleteStatsFlag(int personID);
}
