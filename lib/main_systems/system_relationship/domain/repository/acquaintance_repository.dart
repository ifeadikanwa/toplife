import 'package:toplife/main_systems/system_relationship/domain/model/acquaintance.dart';

abstract class AcquaintanceRepository {
  Future<Acquaintance> createAcquaintance(Acquaintance acquaintance);
  Future<void> updateAcquaintance(Acquaintance acquaintance);
  Future<List<Acquaintance>> getAllAcquaintances(int mainPersonID);
  Future<Acquaintance?> getAcquaintance(int mainPersonID, int acquaintanceID);
  Future<void> deleteAcquaintance(int mainPersonID, int acquaintanceID);
}
