import 'package:toplife/game_systems/main_systems/system_person/domain/dao/tattoo_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_person/domain/repository/tattoo_repository.dart';

class TattooRepositoryImpl implements TattooRepository {
  final TattooDao _tattooDao;

  const TattooRepositoryImpl({required TattooDao tattooDao})
      : _tattooDao = tattooDao;

  @override
  Future<Tattoo> createTattoo(Tattoo tattoo) async {
    return _tattooDao.createTattoo(tattoo);
  }

  @override
  Future<void> deleteTattoo(int tattooID) async {
    return _tattooDao.deleteTattoo(tattooID);
  }

  @override
  Future<Tattoo?> getTattoo(int tattooID) async {
    return _tattooDao.getTattoo(tattooID);
  }

  @override
  Future<void> updateTattoo(Tattoo tattoo) async {
    return _tattooDao.updateTattoo(tattoo);
  }

  @override
  Future<List<Tattoo>> getAllTattoos(int personID) {
    return _tattooDao.getAllTattoos(personID);
  }
}
