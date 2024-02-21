import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';
import 'package:toplife/main_systems/system_school/domain/dao/college_dao.dart';
import 'package:toplife/main_systems/system_school/domain/repository/college_repository.dart';

class CollegeRepositoryImpl implements CollegeRepository {
  final CollegeDao _collegeDao;

  const CollegeRepositoryImpl({required CollegeDao collegeDao})
      : _collegeDao = collegeDao;

  @override
  Future<College> createCollege(College college) {
    return _collegeDao.createCollege(college);
  }

  @override
  Future<void> deleteCollege(int collegeID) {
    return _collegeDao.deleteCollege(collegeID);
  }

  @override
  Future<College?> getActiveCollege(int personID) {
    return _collegeDao.getActiveCollege(personID);
  }

  @override
  Future<List<College>> getAllActiveColleges(int personID) {
    return _collegeDao.getAllActiveColleges(personID);
  }

  @override
  Future<List<College>> getAllColleges(int personID) {
    return _collegeDao.getAllColleges(personID);
  }

  @override
  Future<List<College>> getAllCompletedColleges(int personID) {
    return _collegeDao.getAllCompletedColleges(personID);
  }

  @override
  Future<List<College>> getAllCompletedCollegesForADegree(
      int personID, int degreeID) {
    return _collegeDao.getAllCompletedCollegesForADegree(
        personID: personID, degreeID: degreeID);
  }

  @override
  Future<List<College>> getAllCompletedCollegesForADegreeAtADegreeLevel(
      int personID, int degreeID, SchoolType schoolType) {
    return _collegeDao.getAllCompletedCollegesForADegreeAtADegreeLevel(
        personID: personID, degreeID: degreeID, schoolType: schoolType);
  }

  @override
  Future<List<College>> getAllCompletedDoctorateColleges(int personID) {
    return _collegeDao.getAllCompletedDoctorateColleges(personID);
  }

  @override
  Future<List<College>> getAllCompletedGraduateColleges(int personID) {
    return _collegeDao.getAllCompletedGraduateColleges(personID);
  }

  @override
  Future<List<College>> getAllCompletedLawColleges(int personID) {
    return _collegeDao.getAllCompletedLawColleges(personID);
  }

  @override
  Future<List<College>> getAllCompletedMedicalColleges(int personID) {
    return _collegeDao.getAllCompletedMedicalColleges(personID);
  }

  @override
  Future<List<College>> getAllCompletedNursingColleges(int personID) {
    return _collegeDao.getAllCompletedNursingColleges(personID);
  }

  @override
  Future<List<College>> getAllCompletedPharmacyColleges(int personID) {
    return _collegeDao.getAllCompletedPharmacyColleges(personID);
  }

  @override
  Future<List<College>> getAllCompletedTeacherColleges(int personID) {
    return _collegeDao.getAllCompletedTeacherColleges(personID);
  }

  @override
  Future<List<College>> getAllCompletedUndergraduateColleges(int personID) {
    return _collegeDao.getAllCompletedUndergraduateColleges(personID);
  }

  @override
  Future<List<College>> getAllDoctorateColleges(int personID) {
    return _collegeDao.getAllDoctorateColleges(personID);
  }

  @override
  Future<List<College>> getAllGraduateColleges(int personID) {
    return _collegeDao.getAllGraduateColleges(personID);
  }

  @override
  Future<List<College>> getAllLawColleges(int personID) {
    return _collegeDao.getAllLawColleges(personID);
  }

  @override
  Future<List<College>> getAllMedicalColleges(int personID) {
    return _collegeDao.getAllMedicalColleges(personID);
  }

  @override
  Future<List<College>> getAllNursingColleges(int personID) {
    return _collegeDao.getAllNursingColleges(personID);
  }

  @override
  Future<List<College>> getAllPharmacyColleges(int personID) {
    return _collegeDao.getAllPharmacyColleges(personID);
  }

  @override
  Future<List<College>> getAllTeacherColleges(int personID) {
    return _collegeDao.getAllTeacherColleges(personID);
  }

  @override
  Future<List<College>> getAllUndergraduateColleges(int personID) {
    return _collegeDao.getAllUndergraduateColleges(personID);
  }

  @override
  Future<College?> getCollege(int collegeID) {
    return _collegeDao.getCollege(collegeID);
  }

  @override
  Future<void> updateCollege(College college) {
    return _collegeDao.updateCollege(college);
  }

  @override
  Stream<College?> watchActiveCollege(int personID) {
    return _collegeDao.watchActiveCollege(personID);
  }

  @override
  Stream<List<College>> watchAllColleges(int personID) {
    return _collegeDao.watchAllColleges(personID);
  }

  @override
  Stream<List<College>> watchAllCompletedColleges(int personID) {
    return _collegeDao.watchAllCompletedColleges(personID);
  }

  @override
  Stream<College?> watchCollege(int collegeID) {
    return _collegeDao.watchCollege(collegeID);
  }
}
