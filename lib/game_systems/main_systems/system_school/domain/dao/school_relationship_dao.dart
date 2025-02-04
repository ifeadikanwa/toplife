import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class SchoolRelationshipDao {
  Future<SchoolRelationship> createSchoolRelationship(
      SchoolRelationship schoolRelationship);
  Future<void> updateSchoolRelationship(SchoolRelationship schoolRelationship);
  Future<List<SchoolRelationship>> getAllSchoolRelationships(int schoolID);
  Future<List<SchoolRelationship>> getAllClassmates(int schoolID);
  Stream<List<SchoolRelationship>> watchAllClassmates(int schoolID);
  Future<List<SchoolRelationship>> getAllProfessors(int schoolID);
  Stream<List<SchoolRelationship>> watchAllProfessors(int schoolID);
  Future<SchoolRelationship?> getSchoolRelationship(int schoolRelationshipID);
  Stream<SchoolRelationship?> watchSchoolRelationship(int schoolRelationshipID);
  Future<void> deleteSchoolRelationship(int schoolRelationshipID);
}
