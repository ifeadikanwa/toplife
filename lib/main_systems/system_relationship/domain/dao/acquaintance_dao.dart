import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class AcquaintanceDao {
  Future<Acquaintance> createAcquaintance(Acquaintance acquaintance);
  Future<void> updateAcquaintance(Acquaintance acquaintance);
  Future<List<Acquaintance>> getAllAcquaintance(int mainPersonID);
  Future<Acquaintance?> getAcquaintance(int mainPersonID, int acquaintanceID);
  Future<void> deleteAcquaintance(int mainPersonID, int acquaintanceID);
  Stream<Acquaintance?> watchAcquaintance(int mainPersonID, int acquaintanceID);
  Stream<List<Acquaintance>> watchAllAcquaintance(int mainPersonID);
}
