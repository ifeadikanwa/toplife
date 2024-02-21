import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/domain/dao/school_dao.dart';
import 'package:toplife/main_systems/system_school/domain/repository/school_repository.dart';

class SchoolRepositoryImpl implements SchoolRepository {
  final SchoolDao _schoolDao;

  const SchoolRepositoryImpl({required SchoolDao schoolDao})
      : _schoolDao = schoolDao;

  @override
  Future<School> createSchool(School school) {
    return _schoolDao.createSchool(school);
  }

  @override
  Future<void> deleteSchool(int schoolID) {
    return _schoolDao.deleteSchool(schoolID);
  }

  @override
  Future<School?> findSchoolWithNameAndLocation(
    String name,
    String state,
    String country,
  ) {
    return _schoolDao.findSchoolWithNameAndLocation(
      name: name,
      state: state,
      country: country,
    );
  }

  @override
  Future<School?> getSchool(int schoolID) {
    return _schoolDao.getSchool(schoolID);
  }

  @override
  Future<void> updateSchool(School school) {
    return _schoolDao.updateSchool(school);
  }
}
