import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class EmploymentDao {
  Future<Employment> createEmployment(Employment employment);
  Future<void> updateEmployment(Employment employment);
  Future<List<Employment>> getAllActiveEmployments(int mainPersonID);
  Stream<List<Employment>> watchAllActiveEmployments(int mainPersonID);
  Future<List<Employment>> getAllEmployments(int mainPersonID);
  Future<List<Employment>> getAllEmploymentsForAJob(
    int mainPersonID,
    int jobID,
  );
  Future<Employment?> getEmployment(int employmentID);
  Stream<Employment?> watchEmployment(int employmentID);
  Future<void> deleteEmployment(int employmentID);
}
