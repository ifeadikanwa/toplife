import 'package:toplife/core/data_source/drift_database/database_provider.dart';

abstract class RelationshipDao {
  Future<Relationship> createRelationship(Relationship relationship);
  Future<Relationship?> getRelationship(
    int aPersonID,
    int bPersonID,
  );
  Future<void> updateRelationship(Relationship relationship);
  Future<void> deleteRelationship(
    int aPersonID,
    int bPersonID,
  );
  //get
  Future<Relationship?> getMarriagePartnerRelationship(int personID);
  Future<List<Relationship>> getAllRelationshipsInvolving(int personID);
  Future<List<Relationship>> getAllChildrenOf(int personID);
  //only made getter for stepchildren because they will all come from one person
  //step parents and step siblings can come from multiple parents
  Future<List<Relationship>> getAllStepChildrenOf(int personID);
  Future<List<Relationship>> getAllParentsOf(int personID);
  Future<List<Relationship>> getAllSiblingsOf(int personID);
  Future<List<Relationship>> getAllRelativesOf(int personID);
  Future<List<Relationship>> getAllInLawsOf(int personID);
  Future<List<Relationship>> getAllFriendsOf(int personID);
  Future<List<Relationship>> getAllPastFamilyOf(int personID);
  Future<List<Relationship>> getAllAcquaintancesOf(int personID);
  Future<List<Relationship>> getAllActivePartnersOf(int personID);
  Future<List<Relationship>> getAllPartnersOf(int personID);
  Future<List<Relationship>> getAllExesOf(int personID);

  //watch
  Stream<Relationship?> watchRelationship(
    int aPersonID,
    int bPersonID,
  );
  Stream<Relationship?> watchMarriagePartnerRelationship(int personID);
  Stream<List<Relationship>> watchAllRelationshipsInvolving(int personID);
  Stream<List<Relationship>> watchAllChildrenOf(int personID);
  Stream<List<Relationship>> watchAllParentsOf(int personID);
  Stream<List<Relationship>> watchAllSiblingsOf(int personID);
  Stream<List<Relationship>> watchAllPastFamilyOf(int personID);
  Stream<List<Relationship>> watchAllRelativesOf(int personID);
  Stream<List<Relationship>> watchAllInLawsOf(int personID);
  Stream<List<Relationship>> watchAllFriendsOf(int personID);
  Stream<List<Relationship>> watchAllActivePartnersOf(int personID);
  Stream<List<Relationship>> watchAllPartnersOf(int personID);
  Stream<List<Relationship>> watchAllExesOf(int personID);
}
