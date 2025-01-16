import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class SchoolProjectDao {
  Future<SchoolProject> createSchoolProject(SchoolProject schoolProject);
  Future<void> updateSchoolProject(SchoolProject schoolProject);
  Future<SchoolProject?> getActiveSchoolProject(
      int mainPersonID, int schoolID, int semesterNumber);
  Stream<SchoolProject?> watchActiveSchoolProject(
      int mainPersonID, int schoolID, int semesterNumber);
  Future<List<SchoolProject>> getAllSchoolProjects(int mainPersonID);
  Future<SchoolProject?> getSchoolProject(int schoolProjectID);
  Stream<SchoolProject?> watchSchoolProject(int schoolProjectID);
  Future<void> deleteSchoolProject(int schoolProjectID);
}
