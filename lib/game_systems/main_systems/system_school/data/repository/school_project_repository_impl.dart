import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/school_project_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/repository/school_project_repository.dart';

class SchoolProjectRepositoryImpl implements SchoolProjectRepository {
  final SchoolProjectDao _schoolProjectDao;

  const SchoolProjectRepositoryImpl(
      {required SchoolProjectDao schoolProjectDao})
      : _schoolProjectDao = schoolProjectDao;

  @override
  Future<SchoolProject> createSchoolProject(SchoolProject schoolProject) {
    return _schoolProjectDao.createSchoolProject(schoolProject);
  }

  @override
  Future<void> deleteSchoolProject(int schoolProjectID) {
    return _schoolProjectDao.deleteSchoolProject(schoolProjectID);
  }

  @override
  Future<SchoolProject?> getActiveSchoolProject({
    required int mainPersonID,
    required int schoolID,
    required int semesterNumber,
  }) {
    return _schoolProjectDao.getActiveSchoolProject(
      mainPersonID,
      schoolID,
      semesterNumber,
    );
  }

  @override
  Future<List<SchoolProject>> getAllSchoolProjects(int mainPersonID) {
    return _schoolProjectDao.getAllSchoolProjects(mainPersonID);
  }

  @override
  Future<SchoolProject?> getSchoolProject(int schoolProjectID) {
    return _schoolProjectDao.getSchoolProject(schoolProjectID);
  }

  @override
  Future<void> updateSchoolProject(SchoolProject schoolProject) {
    return _schoolProjectDao.updateSchoolProject(schoolProject);
  }

  @override
  Stream<SchoolProject?> watchActiveSchoolProject({
    required int mainPersonID,
    required int schoolID,
    required int semesterNumber,
  }) {
    return _schoolProjectDao.watchActiveSchoolProject(
        mainPersonID, schoolID, semesterNumber);
  }

  @override
  Stream<SchoolProject?> watchSchoolProject(int schoolProjectID) {
    return _schoolProjectDao.watchSchoolProject(schoolProjectID);
  }
}
