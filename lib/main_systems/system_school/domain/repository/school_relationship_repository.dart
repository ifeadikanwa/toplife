import 'package:toplife/main_systems/system_school/domain/model/school_relationship.dart';

abstract class SchoolRelationshipRepository {
  Future<SchoolRelationship> createSchoolRelationship(SchoolRelationship schoolRelationship);
  Future<void> updateSchoolRelationship(SchoolRelationship schoolRelationship);
  Future<List<SchoolRelationship>> getAllSchoolRelationships(int schoolID);
  Future<List<SchoolRelationship>> getAllClassmates(int schoolID);
  Future<List<SchoolRelationship>> getAllProfessors(int schoolID);
  Future<SchoolRelationship?> getSchoolRelationship(int schoolRelationshipID);
  Future<void> deleteSchoolRelationship(int schoolRelationshipID);
}