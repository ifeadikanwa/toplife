import 'package:toplife/main_systems/system_school/domain/model/school.dart';

abstract class SchoolRepository {
  Future<School> createSchool(School school);
  Future<void> updateSchool(School school);
  Future<School?> getActiveSchool(int mainPersonID);
  Future<List<School>> getAllSchools(int mainPersonID);
  Future<School?> getSchool(int schoolID);
  Future<void> deleteSchool(int schoolID);
}