import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class StanceRepository{
  Future<Stance> createStance(Stance stance);
  Future<Stance?> getStance(int personID);
  Future<void> updateStance(Stance stance);
  Future<void> deleteStance(int stanceID);
}