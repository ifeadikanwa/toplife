import 'package:toplife/main_systems/system_relationship/domain/dao/partner_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/partner_repository.dart';

class PartnerRepositoryImpl implements PartnerRepository {
  final PartnerDao _partnerDao;

  const PartnerRepositoryImpl({required PartnerDao partnerDao})
      : _partnerDao = partnerDao;

  @override
  Future<Partner> createPartner(Partner partner) async {
    return _partnerDao.createPartner(partner);
  }

  @override
  Future<void> deletePartner(int mainPersonID, int partnerID) async {
    return _partnerDao.deletePartner(mainPersonID, partnerID);
  }

  @override
  Future<Partner?> getAPartner(int mainPersonID, int partnerID) async {
    return _partnerDao.getAPartner(mainPersonID, partnerID);
  }

  @override
  Future<List<Partner>> getAllCoparents(int mainPersonID) async {
    return _partnerDao.getAllCoparents(mainPersonID);
  }

  @override
  Future<List<Partner>> getAllExes(int mainPersonID) async {
    return _partnerDao.getAllExes(mainPersonID);
  }

  @override
  Future<List<Partner>> getAllPartners(int mainPersonID) async {
    return _partnerDao.getAllPartners(mainPersonID);
  }

  @override
  Future<Partner?> getCurrentPartner(int mainPersonID) async {
    return _partnerDao.getCurrentPartner(mainPersonID);
  }

  @override
  Future<void> updatePartner(Partner partner) async {
    return _partnerDao.updatePartner(partner);
  }

  @override
  Future<List<Partner>> getAllActivePartners(int mainPersonID) async {
    return _partnerDao.getAllActivePartners(mainPersonID);
  }

  @override
  Stream<Partner?> watchAPartner(int mainPersonID, int partnerID) {
    return _partnerDao.watchAPartner(mainPersonID, partnerID);
  }

  @override
  Stream<List<Partner>> watchAllActivePartners(int mainPersonID) {
    return _partnerDao.watchAllActivePartners(mainPersonID);
  }

  @override
  Stream<List<Partner>> watchAllCoparents(int mainPersonID) {
    return _partnerDao.watchAllCoparents(mainPersonID);
  }

  @override
  Stream<List<Partner>> watchAllExes(int mainPersonID) {
    return _partnerDao.watchAllExes(mainPersonID);
  }

  @override
  Stream<List<Partner>> watchAllPartners(int mainPersonID) {
    return _partnerDao.watchAllPartners(mainPersonID);
  }
}
