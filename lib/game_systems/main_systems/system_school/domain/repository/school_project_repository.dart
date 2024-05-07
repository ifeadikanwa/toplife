import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class SchoolProjectRepository {
  Future<SchoolProject> createSchoolProject(SchoolProject schoolProject);
  Future<void> updateSchoolProject(SchoolProject schoolProject);
  Future<SchoolProject?> getActiveSchoolProject({
    required int mainPersonID,
    required int schoolID,
    required int semesterNumber,
  });
  Stream<SchoolProject?> watchActiveSchoolProject({
    required int mainPersonID,
    required int schoolID,
    required int semesterNumber,
  });
  Future<List<SchoolProject>> getAllSchoolProjects(int mainPersonID);
  Future<SchoolProject?> getSchoolProject(int schoolProjectID);
  Stream<SchoolProject?> watchSchoolProject(int schoolProjectID);
  Future<void> deleteSchoolProject(int schoolProjectID);
}
