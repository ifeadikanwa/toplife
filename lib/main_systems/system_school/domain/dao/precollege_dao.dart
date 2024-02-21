import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_school/constants/school_type.dart';

abstract class PrecollegeDao {
  Future<Precollege> createPrecollege(Precollege precollege);

  Future<void> updatePrecollege(Precollege precollege);

  Future<void> deletePrecollege(
    int personID,
    SchoolType schoolType,
  );

  Future<Precollege?> getPrecollege(
    int personID,
    SchoolType schoolType,
  );

  Future<List<Precollege>> getAllPrecolleges(int personID);

  Future<List<Precollege>> getAllStudentsOfASchool(int schoolID);

  Future<List<Precollege>> getAllActiveStudentsOfASchool(int schoolID);

  Future<Precollege?> getElementarySchool(int personID);

  Future<Precollege?> getMiddleSchool(int personID);

  Future<Precollege?> getHighSchool(int personID);

  Stream<Precollege?> watchPrecollege(
    int personID,
    SchoolType schoolType,
  );

  Stream<List<Precollege>> watchAllPrecolleges(int personID);

  Stream<Precollege?> watchElementarySchool(int personID);

  Stream<Precollege?> watchMiddleSchool(int personID);

  Stream<Precollege?> watchHighSchool(int personID);

  Stream<List<Precollege>> watchAllStudentsOfASchool(int schoolID);

  Stream<List<Precollege>> watchAllActiveStudentsOfASchool(int schoolID);
}
