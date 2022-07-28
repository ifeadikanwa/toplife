import 'package:toplife/main_systems/system_job/domain/model/employment.dart';

abstract class EmploymentDao {
  Future<Employment> createEmployment(Employment employment);
  Future<void> updateEmployment(Employment employment);
  Future<List<Employment>> getAllActiveEmployments(int mainPersonID);
  Future<List<Employment>> getAllEmployments(int mainPersonID);
  Future<List<Employment>> getAllEmploymentsForAJob(
      int mainPersonID, int jobID);
  Future<Employment?> getEmployment(int employmentID);
  Future<void> deleteEmployment(int employmentID);
}
