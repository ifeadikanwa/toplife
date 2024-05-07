import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class FacultyRepository {
  Future<Faculty> createOrUpdateFaculty(Faculty faculty);

  Future<Faculty?> getFaculty(int personID);

  Future<void> deleteFaculty(int personID);

  Future<List<Faculty>> getAllFacultyForSchool(int schoolID);

  Stream<Faculty?> watchFaculty(int personID);

  Stream<List<Faculty>> watchAllFacultyForSchool(int schoolID);
}
