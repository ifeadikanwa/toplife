import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class PiercingDao {
  Future<Piercing> createPiercing(Piercing piercing);
  Future<Piercing?> getPiercing(int piercingID);
  Future<void> updatePiercing(Piercing piercing);
  Future<void> deletePiercing(int piercingID);
  Future<List<Piercing>> getAllPiercings(int personID);
}
