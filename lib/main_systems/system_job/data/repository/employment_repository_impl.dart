import 'package:toplife/main_systems/system_job/domain/dao/employment_dao.dart';
import 'package:toplife/main_systems/system_job/domain/model/employment.dart';
import 'package:toplife/main_systems/system_job/domain/repository/employment_repository.dart';

class EmploymentRepositoryImpl implements EmploymentRepository {
  final EmploymentDao _employmentDao;

  const EmploymentRepositoryImpl({required EmploymentDao employmentDao})
      : _employmentDao = employmentDao;

  @override
  Future<Employment> createEmployment(Employment employment) async {
    return _employmentDao.createEmployment(employment);
  }

  @override
  Future<void> deleteEmployment(int employmentID) async {
    return _employmentDao.deleteEmployment(employmentID);
  }

  @override
  Future<List<Employment>> getAllActiveEmployments(int mainPersonID) async {
    return _employmentDao.getAllActiveEmployments(mainPersonID);
  }

  @override
  Future<List<Employment>> getAllEmployments(int mainPersonID) async {
    return _employmentDao.getAllEmployments(mainPersonID);
  }

  @override
  Future<Employment?> getEmployment(int employmentID) async {
    return _employmentDao.getEmployment(employmentID);
  }

  @override
  Future<void> updateEmployment(Employment employment) async {
    return _employmentDao.updateEmployment(employment);
  }

  @override
  Future<List<Employment>> getAllEmploymentsForAJob(
      int mainPersonID, int jobID) {
    return _employmentDao.getAllEmploymentsForAJob(mainPersonID, jobID);
  }
}
