import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/dao/relationship_dao.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/repository/relationship_repository.dart';

class RelationshipRepositoryImpl implements RelationshipRepository {
  final RelationshipDao _relationshipDao;

  const RelationshipRepositoryImpl({
    required RelationshipDao relationshipDao,
  }) : _relationshipDao = relationshipDao;

  @override
  Future<Relationship> createRelationship(Relationship relationship) {
    return _relationshipDao.createRelationship(relationship);
  }

  @override
  Future<void> deleteRelationship(int aPersonID, int bPersonID) {
    return _relationshipDao.deleteRelationship(aPersonID, bPersonID);
  }

  @override
  Future<List<Relationship>> getAllAcquaintancesOf(int personID) {
    return _relationshipDao.getAllAcquaintancesOf(personID);
  }

  @override
  Future<List<Relationship>> getAllActivePartnersOf(int personID) {
    return _relationshipDao.getAllActivePartnersOf(personID);
  }

  @override
  Future<List<Relationship>> getAllChildrenOf(int personID) {
    return _relationshipDao.getAllChildrenOf(personID);
  }

  @override
  Future<List<Relationship>> getAllExesOf(int personID) {
    return _relationshipDao.getAllExesOf(personID);
  }

  @override
  Future<List<Relationship>> getAllFriendsOf(int personID) {
    return _relationshipDao.getAllFriendsOf(personID);
  }

  @override
  Future<List<Relationship>> getAllPastFamilyOf(int personID) {
    return _relationshipDao.getAllPastFamilyOf(personID);
  }

  @override
  Future<List<Relationship>> getAllInLawsOf(int personID) {
    return _relationshipDao.getAllInLawsOf(personID);
  }

  @override
  Future<List<Relationship>> getAllParentsOf(int personID) {
    return _relationshipDao.getAllParentsOf(personID);
  }

  @override
  Future<List<Relationship>> getAllPartnersOf(int personID) {
    return _relationshipDao.getAllPartnersOf(personID);
  }

  @override
  Future<List<Relationship>> getAllRelationshipsInvolving(int personID) {
    return _relationshipDao.getAllRelationshipsInvolving(personID);
  }

  @override
  Future<List<Relationship>> getAllRelativesOf(int personID) {
    return _relationshipDao.getAllRelativesOf(personID);
  }

  @override
  Future<List<Relationship>> getAllSiblingsOf(int personID) {
    return _relationshipDao.getAllSiblingsOf(personID);
  }

  @override
  Future<List<Relationship>> getAllStepChildrenOf(int personID) {
    return _relationshipDao.getAllStepChildrenOf(personID);
  }

  @override
  Future<Relationship?> getRelationship(int aPersonID, int bPersonID) {
    return _relationshipDao.getRelationship(aPersonID, bPersonID);
  }

  @override
  Future<void> updateRelationship(Relationship relationship) {
    return _relationshipDao.updateRelationship(relationship);
  }

  @override
  Stream<List<Relationship>> watchAllActivePartnersOf(int personID) {
    return _relationshipDao.watchAllActivePartnersOf(personID);
  }

  @override
  Stream<List<Relationship>> watchAllChildrenOf(int personID) {
    return _relationshipDao.watchAllChildrenOf(personID);
  }

  @override
  Stream<List<Relationship>> watchAllExesOf(int personID) {
    return _relationshipDao.watchAllExesOf(personID);
  }

  @override
  Stream<List<Relationship>> watchAllFriendsOf(int personID) {
    return _relationshipDao.watchAllFriendsOf(personID);
  }

  @override
  Stream<List<Relationship>> watchAllInLawsOf(int personID) {
    return _relationshipDao.watchAllInLawsOf(personID);
  }

  @override
  Stream<List<Relationship>> watchAllParentsOf(int personID) {
    return _relationshipDao.watchAllParentsOf(personID);
  }

  @override
  Stream<List<Relationship>> watchAllPartnersOf(int personID) {
    return _relationshipDao.watchAllPartnersOf(personID);
  }

  @override
  Stream<List<Relationship>> watchAllRelationshipsInvolving(int personID) {
    return _relationshipDao.watchAllRelationshipsInvolving(personID);
  }

  @override
  Stream<List<Relationship>> watchAllRelativesOf(int personID) {
    return _relationshipDao.watchAllRelativesOf(personID);
  }

  @override
  Stream<List<Relationship>> watchAllSiblingsOf(int personID) {
    return _relationshipDao.watchAllSiblingsOf(personID);
  }

  @override
  Stream<Relationship?> watchRelationship(int aPersonID, int bPersonID) {
    return _relationshipDao.watchRelationship(aPersonID, bPersonID);
  }

  @override
  Future<Relationship?> getMarriagePartnerRelationship(int personID) {
    return _relationshipDao.getMarriagePartnerRelationship(personID);
  }

  @override
  Stream<Relationship?> watchMarriagePartnerRelationship(int personID) {
    return _relationshipDao.watchMarriagePartnerRelationship(personID);
  }

  @override
  Stream<List<Relationship>> watchAllPastFamilyOf(int personID) {
    return _relationshipDao.watchAllPastFamilyOf(personID);
  }

  @override
  Future<List<Relationship>> getChildrensTabRelationships(int playerID) {
    return _relationshipDao.getChildrensTabRelationships(playerID);
  }

  @override
  Future<List<Relationship>> getParentsTabRelationships(int playerID) {
    return _relationshipDao.getParentsTabRelationships(playerID);
  }

  @override
  Future<List<Relationship>> getPartnersTabRelationships(int playerID) {
    return _relationshipDao.getPartnersTabRelationships(playerID);
  }

  @override
  Future<List<Relationship>> getRelativesTabRelationships(int playerID) {
    return _relationshipDao.getRelativesTabRelationships(playerID);
  }

  @override
  Future<List<Relationship>> getSiblingsTabRelationships(int playerID) {
    return _relationshipDao.getSiblingsTabRelationships(playerID);
  }

  @override
  Stream<List<Relationship>> watchChildrensTabRelationships(int playerID) {
    return _relationshipDao.watchChildrensTabRelationships(playerID);
  }

  @override
  Stream<List<Relationship>> watchParentsTabRelationships(int playerID) {
    return _relationshipDao.watchParentsTabRelationships(playerID);
  }

  @override
  Stream<List<Relationship>> watchPartnersTabRelationships(int playerID) {
    return _relationshipDao.watchPartnersTabRelationships(playerID);
  }

  @override
  Stream<List<Relationship>> watchRelativesTabRelationships(int playerID) {
    return _relationshipDao.watchRelativesTabRelationships(playerID);
  }

  @override
  Stream<List<Relationship>> watchSiblingsTabRelationships(int playerID) {
    return _relationshipDao.watchSiblingsTabRelationships(playerID);
  }
}
