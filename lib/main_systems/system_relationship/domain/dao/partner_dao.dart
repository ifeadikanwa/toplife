import 'package:toplife/main_systems/system_relationship/domain/model/partner.dart';

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
}
