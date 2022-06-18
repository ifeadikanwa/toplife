import 'package:toplife/main_systems/system_relationship/domain/model/acquaintance.dart';

abstract class AcquaintanceDao {
  Future<Acquaintance> createAcquaintance(Acquaintance acquaintance);
  Future<void> updateAcquaintance(Acquaintance acquaintance);
  Future<List<Acquaintance>> getAllAcquaintance(int mainPersonID);
  Future<Acquaintance?> getAcquaintance(int mainPersonID, int acquaintanceID);
  Future<void> deleteAcquaintance(int mainPersonID, int acquaintanceID);
}
