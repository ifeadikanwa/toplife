import 'package:toplife/main_systems/system_relationship/domain/dao/inlaw_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/domain/repository/inlaw_repository.dart';

class InLawRepositoryImpl implements InLawRepository {
  final InLawDao _inLawDao;

  const InLawRepositoryImpl({required InLawDao inLawDao})
      : _inLawDao = inLawDao;

  @override
  Future<InLaw> createInLaw(InLaw inLaw) async {
    return _inLawDao.createInLaw(inLaw);
  }

  @override
  Future<void> deleteInLaw(int mainPersonID, int inLawID) async {
    return _inLawDao.deleteInLaw(mainPersonID, inLawID);
  }

  @override
  Future<List<InLaw>> getAllInLaws(int mainPersonID) async {
    return _inLawDao.getAllInLaws(mainPersonID);
  }

  @override
  Future<InLaw?> getInLaw(int mainPersonID, int inLawID) async {
    return _inLawDao.getInLaw(mainPersonID, inLawID);
  }

  @override
  Future<void> updateInLaw(InLaw inLaw) async {
    return _inLawDao.updateInLaw(inLaw);
  }

  @override
  Stream<InLaw?> watchInLaw(int mainPersonID, int inLawID) {
    return _inLawDao.watchInLaw(mainPersonID, inLawID);
  }

  @override
  Stream<List<InLaw>> watchAllInLaws(int mainPersonID) {
    return _inLawDao.watchAllInLaws(mainPersonID);
  }
}
