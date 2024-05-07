import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/dao/school_relationship_dao.dart';
import 'package:toplife/game_systems/main_systems/system_school/domain/repository/school_relationship_repository.dart';

class SchoolRelationshipRepositoryImpl implements SchoolRelationshipRepository {
  final SchoolRelationshipDao _schoolRelationshipDao;

  const SchoolRelationshipRepositoryImpl(
      {required SchoolRelationshipDao schoolRelationshipDao})
      : _schoolRelationshipDao = schoolRelationshipDao;

  @override
  Future<SchoolRelationship> createSchoolRelationship(
    SchoolRelationship schoolRelationship,
  ) async {
    return _schoolRelationshipDao.createSchoolRelationship(schoolRelationship);
  }

  @override
  Future<void> deleteSchoolRelationship(
    int schoolRelationshipID,
  ) async {
    return _schoolRelationshipDao
        .deleteSchoolRelationship(schoolRelationshipID);
  }

  @override
  Future<List<SchoolRelationship>> getAllClassmates(
    int schoolID,
  ) async {
    return _schoolRelationshipDao.getAllClassmates(schoolID);
  }

  @override
  Future<List<SchoolRelationship>> getAllProfessors(
    int schoolID,
  ) async {
    return _schoolRelationshipDao.getAllProfessors(schoolID);
  }

  @override
  Future<List<SchoolRelationship>> getAllSchoolRelationships(
    int schoolID,
  ) async {
    return _schoolRelationshipDao.getAllSchoolRelationships(schoolID);
  }

  @override
  Future<SchoolRelationship?> getSchoolRelationship(
    int schoolRelationshipID,
  ) async {
    return _schoolRelationshipDao.getSchoolRelationship(schoolRelationshipID);
  }

  @override
  Future<void> updateSchoolRelationship(
    SchoolRelationship schoolRelationship,
  ) async {
    return _schoolRelationshipDao.updateSchoolRelationship(schoolRelationship);
  }

  @override
  Stream<List<SchoolRelationship>> watchAllClassmates(int schoolID) {
    return _schoolRelationshipDao.watchAllClassmates(schoolID);
  }

  @override
  Stream<List<SchoolRelationship>> watchAllProfessors(int schoolID) {
    return _schoolRelationshipDao.watchAllProfessors(schoolID);
  }

  @override
  Stream<SchoolRelationship?> watchSchoolRelationship(
      int schoolRelationshipID) {
    return _schoolRelationshipDao.watchSchoolRelationship(schoolRelationshipID);
  }
}
