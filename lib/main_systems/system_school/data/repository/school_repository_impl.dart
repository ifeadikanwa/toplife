import 'package:toplife/main_systems/system_school/domain/dao/school_dao.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';
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
}
