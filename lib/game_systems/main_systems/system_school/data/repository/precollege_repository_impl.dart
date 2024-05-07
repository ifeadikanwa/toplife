import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/precollege_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/repository/precollege_repository.dart';

class PrecollegeRepositoryImpl implements PrecollegeRepository {
  final PrecollegeDao _precollegeDao;

  const PrecollegeRepositoryImpl({required PrecollegeDao precollegeDao})
      : _precollegeDao = precollegeDao;

  @override
  Future<Precollege> createPrecollege(Precollege precollege) {
    return _precollegeDao.createPrecollege(precollege);
  }

  @override
  Future<void> deletePrecollege(int personID, SchoolType schoolType) {
    return _precollegeDao.deletePrecollege(personID, schoolType);
  }

  @override
  Future<List<Precollege>> getAllPrecolleges(int personID) {
    return _precollegeDao.getAllPrecolleges(personID);
  }

  @override
  Future<Precollege?> getElementarySchool(int personID) {
    return _precollegeDao.getElementarySchool(personID);
  }

  @override
  Future<Precollege?> getHighSchool(int personID) {
    return _precollegeDao.getHighSchool(personID);
  }

  @override
  Future<Precollege?> getMiddleSchool(int personID) {
    return _precollegeDao.getMiddleSchool(personID);
  }

  @override
  Future<Precollege?> getPrecollege(int personID, SchoolType schoolType) {
    return _precollegeDao.getPrecollege(personID, schoolType);
  }

  @override
  Future<void> updatePrecollege(Precollege precollege) {
    return _precollegeDao.updatePrecollege(precollege);
  }

  @override
  Stream<List<Precollege>> watchAllPrecolleges(int personID) {
    return _precollegeDao.watchAllPrecolleges(personID);
  }

  @override
  Stream<Precollege?> watchElementarySchool(int personID) {
    return _precollegeDao.watchElementarySchool(personID);
  }

  @override
  Stream<Precollege?> watchHighSchool(int personID) {
    return _precollegeDao.watchHighSchool(personID);
  }

  @override
  Stream<Precollege?> watchMiddleSchool(int personID) {
    return _precollegeDao.watchMiddleSchool(personID);
  }

  @override
  Stream<Precollege?> watchPrecollege(int personID, SchoolType schoolType) {
    return _precollegeDao.watchPrecollege(personID, schoolType);
  }

  @override
  Future<List<Precollege>> getAllStudentsOfASchool(int schoolID) {
    return _precollegeDao.getAllStudentsOfASchool(schoolID);
  }

  @override
  Stream<List<Precollege>> watchAllStudentsOfASchool(int schoolID) {
    return _precollegeDao.watchAllStudentsOfASchool(schoolID);
  }

  @override
  Future<List<Precollege>> getAllActiveStudentsOfASchool(int schoolID) {
    return _precollegeDao.getAllActiveStudentsOfASchool(schoolID);
  }

  @override
  Stream<List<Precollege>> watchAllActiveStudentsOfASchool(int schoolID) {
    return _precollegeDao.watchAllActiveStudentsOfASchool(schoolID);
  }
}
