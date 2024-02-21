import 'package:toplife/main_systems/system_person/domain/dao/baby_traits_dao.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/repository/baby_traits_repository.dart';

class BabyTraitsRepositoryImpl implements BabyTraitsRepository {
  final BabyTraitsDao _babyTraitsDao;

  const BabyTraitsRepositoryImpl({required BabyTraitsDao babyTraitsDao})
      : _babyTraitsDao = babyTraitsDao;

  @override
  Future<BabyTraits> createBabyTraits(BabyTraits babyTraits) async {
    return _babyTraitsDao.createBabyTraits(babyTraits);
  }

  @override
  Future<void> deleteBabyTraits(int babyTraitsID) async {
    return _babyTraitsDao.deleteBabyTraits(babyTraitsID);
  }

  @override
  Future<BabyTraits?> getBabyTraits(int personID) async {
    return _babyTraitsDao.getBabyTraits(personID);
  }

  @override
  Future<void> updateBabyTraits(BabyTraits babyTraits) async {
    return _babyTraitsDao.updateBabyTraits(babyTraits);
  }

  @override
  Stream<BabyTraits?> watchBabyTraits(int personID) {
    return _babyTraitsDao.watchBabyTraits(personID);
  }
}
