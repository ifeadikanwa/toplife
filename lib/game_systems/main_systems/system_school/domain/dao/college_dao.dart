import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_school/constants/school_type.dart';

abstract class CollegeDao {
  Future<College> createCollege(College college);

  Future<void> updateCollege(College college);

  Future<void> deleteCollege(int collegeID);

  Future<College?> getCollege(int collegeID);

  Future<List<College>> getAllColleges(int personID);

  //active
  Future<College?> getActiveCollege(int personID);

  Future<List<College>> getAllActiveColleges(int personID);

  //college types
  Future<List<College>> getAllUndergraduateColleges(int personID);

  Future<List<College>> getAllGraduateColleges(int personID);

  Future<List<College>> getAllDoctorateColleges(int personID);

  Future<List<College>> getAllMedicalColleges(int personID);

  Future<List<College>> getAllNursingColleges(int personID);

  Future<List<College>> getAllLawColleges(int personID);

  Future<List<College>> getAllPharmacyColleges(int personID);

  Future<List<College>> getAllTeacherColleges(int personID);

  //completed college types
  Future<List<College>> getAllCompletedUndergraduateColleges(int personID);

  Future<List<College>> getAllCompletedGraduateColleges(int personID);

  Future<List<College>> getAllCompletedDoctorateColleges(int personID);

  Future<List<College>> getAllCompletedMedicalColleges(int personID);

  Future<List<College>> getAllCompletedNursingColleges(int personID);

  Future<List<College>> getAllCompletedLawColleges(int personID);

  Future<List<College>> getAllCompletedPharmacyColleges(int personID);

  Future<List<College>> getAllCompletedTeacherColleges(int personID);

  //completed degrees
  Future<List<College>> getAllCompletedColleges(int personID);

  Future<List<College>> getAllCompletedCollegesForADegree({
    required int personID,
    required int degreeID,
  });

  Future<List<College>> getAllCompletedCollegesForADegreeAtADegreeLevel({
    required int personID,
    required int degreeID,
    required SchoolType schoolType,
  });

  //watch
  Stream<College?> watchCollege(int collegeID);

  Stream<College?> watchActiveCollege(int personID);

  Stream<List<College>> watchAllColleges(int personID);

  Stream<List<College>> watchAllCompletedColleges(int personID);
}
