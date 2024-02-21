import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class SchoolRepository {
  Future<School> createSchool(School school);

  Future<void> updateSchool(School school);

  Future<School?> getSchool(int schoolID);

  Future<void> deleteSchool(int schoolID);

  Future<School?> findSchoolWithNameAndLocation(
    String name,
    String state,
    String country,
  );
}
