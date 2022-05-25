import 'package:toplife/main_systems/system_person/domain/dao/relationship_traits_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/relationship_traits.dart';
import 'package:toplife/main_systems/system_person/domain/repository/relationship_traits_repository.dart';

class RelationshipTraitsRepositoryImpl implements RelationshipTraitsRepository {
  final RelationshipTraitsDao _relationshipTraitsDao;

  const RelationshipTraitsRepositoryImpl({
    required RelationshipTraitsDao relationshipTraitsDao,
  }) : _relationshipTraitsDao = relationshipTraitsDao;

  @override
  Future<RelationshipTraits> createRelationshipTraits(
      RelationshipTraits relationshipTraits) async {
    return _relationshipTraitsDao.createRelationshipTraits(relationshipTraits);
  }

  @override
  Future<void> deleteRelationshipTraits(int relationshipTraitsID) async {
    return _relationshipTraitsDao
        .deleteRelationshipTraits(relationshipTraitsID);
  }

  @override
  Future<RelationshipTraits?> getRelationshipTraits(
      int personID) async {
    return _relationshipTraitsDao.getRelationshipTraits(personID);
  }

  @override
  Future<void> updateRelationshipTraits(
      RelationshipTraits relationshipTraits) async {
    return _relationshipTraitsDao.updateRelationshipTraits(relationshipTraits);
  }
}
