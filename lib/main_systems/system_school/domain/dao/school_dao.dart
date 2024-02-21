import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class SchoolDao {
  Future<School> createSchool(School school);

  Future<void> updateSchool(School school);

  Future<School?> getSchool(int schoolID);

  Future<void> deleteSchool(int schoolID);

  Future<School?> findSchoolWithNameAndLocation({
    required String name,
    required String state,
    required String country,
  });
}
