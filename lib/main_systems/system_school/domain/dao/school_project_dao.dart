import 'package:toplife/main_systems/system_school/domain/model/school_project.dart';

abstract class SchoolProjectDao {
  Future<SchoolProject> createSchoolProject(SchoolProject schoolProject);
  Future<void> updateSchoolProject(SchoolProject schoolProject);
  Future<SchoolProject?> getActiveSchoolProject(int mainPersonID, int schoolID, int semesterNumber);
  Future<List<SchoolProject>> getAllSchoolProjects(int mainPersonID);
  Future<SchoolProject?> getSchoolProject(int schoolProjectID);
  Future<void> deleteSchoolProject(int schoolProjectID);
}