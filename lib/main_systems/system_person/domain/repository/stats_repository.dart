import 'package:toplife/main_systems/system_person/domain/model/stats.dart';

abstract class StatsRepository{
  Future<Stats> createStats(Stats stats);
  Future<Stats?> getStats(int personID);
  Future<void> updateStats(Stats stats);
  Future<void> deleteStats(int statsID);
}