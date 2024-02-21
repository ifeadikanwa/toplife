import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/domain/dao/faculty_dao.dart';
import 'package:toplife/main_systems/system_school/domain/repository/faculty_repository.dart';

class FacultyRepositoryImpl implements FacultyRepository {
  final FacultyDao _facultyDao;

  const FacultyRepositoryImpl({required FacultyDao facultyDao})
      : _facultyDao = facultyDao;

  @override
  Future<Faculty> createOrUpdateFaculty(Faculty faculty) {
    return _facultyDao.createOrUpdateFaculty(faculty);
  }

  @override
  Future<void> deleteFaculty(int personID) {
    return _facultyDao.deleteFaculty(personID);
  }

  @override
  Future<List<Faculty>> getAllFacultyForSchool(int schoolID) {
    return _facultyDao.getAllFacultyForSchool(schoolID);
  }

  @override
  Future<Faculty?> getFaculty(int personID) {
    return _facultyDao.getFaculty(personID);
  }

  @override
  Stream<List<Faculty>> watchAllFacultyForSchool(int schoolID) {
    return _facultyDao.watchAllFacultyForSchool(schoolID);
  }

  @override
  Stream<Faculty?> watchFaculty(int personID) {
    return _facultyDao.watchFaculty(personID);
  }
}
