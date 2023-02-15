import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class StatsDao {
  Future<Stats> createStats(Stats stats);
  Future<Stats?> getStats(int personID);
  Future<void> updateStats(Stats stats);
  Future<void> deleteStats(int statsID);
  Stream<Stats?> watchStats(int personID);
}