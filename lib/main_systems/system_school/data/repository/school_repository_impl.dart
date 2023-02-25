import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/constants/degree_level.dart';
import 'package:toplife/main_systems/system_school/domain/dao/school_dao.dart';
import 'package:toplife/main_systems/system_school/domain/repository/school_repository.dart';

class SchoolRepositoryImpl implements SchoolRepository {
  final SchoolDao _schoolDao;

  const SchoolRepositoryImpl({required SchoolDao schoolDao})
      : _schoolDao = schoolDao;

  @override
  Future<School> createSchool(School school) async {
    return _schoolDao.createSchool(school);
  }

  @override
  Future<void> deleteSchool(int schoolID) async {
    return _schoolDao.deleteSchool(schoolID);
  }

  @override
  Future<School?> getActiveSchool(int mainPersonID) async {
    return _schoolDao.getActiveSchool(mainPersonID);
  }

  @override
  Future<List<School>> getAllSchools(int mainPersonID) async {
    return _schoolDao.getAllSchools(mainPersonID);
  }

  @override
  Future<School?> getSchool(int schoolID) async {
    return _schoolDao.getSchool(schoolID);
  }

  @override
  Future<void> updateSchool(School school) async {
    return _schoolDao.updateSchool(school);
  }

  @override
  Future<List<School>> getAllCompletedSchool(int mainPersonID) async {
    return _schoolDao.getAllCompletedSchool(mainPersonID);
  }

  @override
  Future<List<School>> getAllCompletedSchoolForADegree(
      int mainPersonID, int degreeID) async {
    return _schoolDao.getAllCompletedSchoolForADegree(mainPersonID, degreeID);
  }

  @override
  Future<List<School>> getAllCompletedDoctorateSchool(int mainPersonID) async {
    return _schoolDao.getAllCompletedDoctorateSchool(mainPersonID);
  }

  @override
  Future<List<School>> getAllCompletedGraduateSchool(int mainPersonID) async {
    return _schoolDao.getAllCompletedGraduateSchool(mainPersonID);
  }

  @override
  Future<List<School>> getAllCompletedUndergraduateSchool(
      int mainPersonID) async {
    return _schoolDao.getAllCompletedUndergraduateSchool(mainPersonID);
  }

  @override
  Future<List<School>> getAllActiveSchools(int mainPersonID) async {
    return _schoolDao.getAllActiveSchools(mainPersonID);
  }

  @override
  Future<School?> getCompletedSchoolForADegreeAtADegreeLevel(
    int mainPersonID,
    int degreeID,
    DegreeLevel degreeLevel,
  ) async {
    return _schoolDao.getCompletedSchoolForADegreeAtADegreeLevel(
      mainPersonID,
      degreeID,
      degreeLevel,
    );
  }

  @override
  Future<List<School>> getAllCompletedSpecialSchool(int mainPersonID) async {
    return _schoolDao.getAllCompletedSpecialSchool(mainPersonID);
  }

  @override
  Stream<School?> watchSchool(int schoolID) {
    return _schoolDao.watchSchool(schoolID);
  }
}
