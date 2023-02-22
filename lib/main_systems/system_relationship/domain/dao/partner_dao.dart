import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class PartnerDao {
  Future<Partner> createPartner(Partner partner);
  Future<void> updatePartner(Partner partner);
  Future<List<Partner>> getAllActivePartners(int mainPersonID);
  Future<List<Partner>> getAllPartners(int mainPersonID);
  Future<List<Partner>> getAllCoparents(int mainPersonID);
  Future<List<Partner>> getAllExes(int mainPersonID);
  Future<Partner?> getAPartner(int mainPersonID, int partnerID);
  Future<Partner?> getCurrentPartner(int mainPersonID);
  Future<void> deletePartner(int mainPersonID, int partnerID);
  Stream<Partner?> watchAPartner(int mainPersonID, int partnerID);
  Stream<List<Partner>> watchAllActivePartners(int mainPersonID);
  Stream<List<Partner>> watchAllPartners(int mainPersonID);
  Stream<List<Partner>> watchAllCoparents(int mainPersonID);
  Stream<List<Partner>> watchAllExes(int mainPersonID);
}
