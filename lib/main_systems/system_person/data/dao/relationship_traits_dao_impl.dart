import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_person/domain/dao/relationship_traits_dao.dart';
import 'package:toplife/main_systems/system_person/domain/model/relationship_traits.dart';

part 'relationship_traits_dao_impl.g.dart';

@DriftAccessor(tables: [RelationshipTraitsTable])
class RelationshipTraitsDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$RelationshipTraitsDaoImplMixin
    implements RelationshipTraitsDao {
  RelationshipTraitsDaoImpl(DatabaseProvider database) : super(database);

  @override
  Future<RelationshipTraits> createRelationshipTraits(
      RelationshipTraits relationshipTraits) async {
    final RelationshipTraitsTableCompanion relationshipTraitsWithoutID =
        relationshipTraits.toCompanion(false).copyWith(
              id: const Value.absent(),
            );
    final relationshipTraitsID =
        await into(relationshipTraitsTable).insertOnConflictUpdate(
      relationshipTraitsWithoutID,
    );
    return relationshipTraits.copyWith(id: relationshipTraitsID);
  }

  @override
  Future<void> deleteRelationshipTraits(int relationshipTraitsID) {
    return (delete(relationshipTraitsTable)
          ..where(
            (relationshipTraits) =>
                relationshipTraits.id.equals(relationshipTraitsID),
          ))
        .go();
  }

  @override
  Future<RelationshipTraits?> getRelationshipTraits(int personID) {
    return (select(relationshipTraitsTable)
          ..where((relationshipTraits) =>
              relationshipTraits.personId.equals(personID))
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateRelationshipTraits(RelationshipTraits relationshipTraits) {
    return update(relationshipTraitsTable).replace(relationshipTraits);
  }
}
