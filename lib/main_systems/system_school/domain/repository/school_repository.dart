import 'package:toplife/main_systems/system_school/constants/degree_level.dart';
import 'package:toplife/main_systems/system_school/domain/model/school.dart';

abstract class SchoolRepository {
  Future<School> createSchool(School school);
  Future<void> updateSchool(School school);
  Future<School?> getCompletedSchoolForADegreeAtADegreeLevel(
      int mainPersonID, int degreeID, DegreeLevel degreeLevel);
  Future<School?> getActiveSchool(int mainPersonID);
  Future<List<School>> getAllActiveSchools(int mainPersonID);
  Future<List<School>> getAllCompletedUndergraduateSchool(int mainPersonID);
  Future<List<School>> getAllCompletedGraduateSchool(int mainPersonID);
  Future<List<School>> getAllCompletedDoctorateSchool(int mainPersonID);
  Future<List<School>> getAllCompletedSpecialSchool(int mainPersonID);
  Future<List<School>> getAllCompletedSchool(int mainPersonID);
  Future<List<School>> getAllCompletedSchoolForADegree(
      int mainPersonID, int degreeID);
  Future<List<School>> getAllSchools(int mainPersonID);
  Future<School?> getSchool(int schoolID);
  Future<void> deleteSchool(int schoolID);
}
