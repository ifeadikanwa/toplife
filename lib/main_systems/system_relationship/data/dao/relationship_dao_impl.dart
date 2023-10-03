import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/dao/relationship_dao.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/relationship.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

part 'relationship_dao_impl.g.dart';

@DriftAccessor(tables: [RelationshipTable])
class RelationshipDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$RelationshipDaoImplMixin
    implements RelationshipDao {
  RelationshipDaoImpl(DatabaseProvider database) : super(database);

  //// some relationships are same level while others are multilevel.
  //// So sometimes it is important thet the correct person is labeled main.
  // SCRAP EVERYTHING ABOVE.
  //It shouldnt matter who is main or other because that just creates room for error.
  //ONLY  the players family relationships are stored.
  //so at the start of every new player, ALL family relationships should change to their perspective.
  //Example: Old player -> John, has a relationship: John -> Frank - CHILD
  //if new player -> Frank, we simply change the existing John -> Frank relationship to say PARENT.
  //because all family relationships are now from Frank's perspective

  //ONLY NPC partner relationships are stored here because we need to link them to their partners

  //multiple platonic relationship types can exist at a time
  //ONLY one romantic relationship type can exist at a time

  @override
  Future<Relationship> createRelationship(Relationship relationship) async {
    final Relationship checkedRelationship = relationship.copyWith(
      level: crossCheckStat(
        stat: relationship.level,
        statsRange: StatsRangeConstants.relationshipRange,
      ),
    );

    await into(relationshipTable).insertOnConflictUpdate(checkedRelationship);
    return checkedRelationship;
  }

  @override
  Future<void> deleteRelationship(int aPersonID, int bPersonID) {
    return (delete(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(aPersonID) &
                    relationship.secondPersonId.equals(bPersonID)) |
                (relationship.firstPersonId.equals(bPersonID) &
                    relationship.secondPersonId.equals(aPersonID)),
          ))
        .go();
  }

  @override
  Future<Relationship?> getRelationship(int aPersonID, int bPersonID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(aPersonID) &
                    relationship.secondPersonId.equals(bPersonID)) |
                (relationship.firstPersonId.equals(bPersonID) &
                    relationship.secondPersonId.equals(aPersonID)),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Future<void> updateRelationship(Relationship relationship) {
    final Relationship checkedRelationship = relationship.copyWith(
      level: crossCheckStat(
        stat: relationship.level,
        statsRange: StatsRangeConstants.relationshipRange,
      ),
    );
    return update(relationshipTable).replace(checkedRelationship);
  }

  @override
  Future<List<Relationship>> getAllAcquaintancesOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.platonicRelationshipType.equals(
                  PlatonicRelationshipType.acquaintance.name,
                ),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getAllActivePartnersOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.romanticRelationshipType.isNotValue(
                  RomanticRelationshipType.none.name,
                ) &
                relationship.activeRomance.equals(true),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getAllChildrenOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.birthChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.adoptiveChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepChild),
                    )),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getAllExesOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.romanticRelationshipType.isNotValue(
                  RomanticRelationshipType.none.name,
                ) &
                relationship.activeRomance.equals(false),
          ))
        .get();
  }

  //Only get friends with no romantic relationship
  @override
  Future<List<Relationship>> getAllFriendsOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.platonicRelationshipType.equals(
                  PlatonicRelationshipType.friend.name,
                ) &
                relationship.romanticRelationshipType.equals(
                  RomanticRelationshipType.none.name,
                ),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getAllInLawsOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.siblingInLaw),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.parentInLaw),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.childInLaw),
                    )),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getAllParentsOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.birthParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.adoptiveParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepParent),
                    )),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getAllPartnersOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.romanticRelationshipType.isNotValue(
                  RomanticRelationshipType.none.name,
                ),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getAllRelationshipsInvolving(int personID) {
    return (select(relationshipTable)
          ..where((relationship) =>
              (relationship.firstPersonId.equals(personID) |
                  relationship.secondPersonId.equals(personID))))
        .get();
  }

  @override
  Future<List<Relationship>> getAllRelativesOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.cousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.nibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.pibling),
                    )),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getAllSiblingsOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.halfSibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.fullSibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.adoptiveSibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepSibling),
                    )),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getAllStepChildrenOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                  getDbFormattedPlatonicRelationshipTypeString(
                      PlatonicRelationshipType.stepChild),
                )),
          ))
        .get();
  }

  @override
  Stream<List<Relationship>> watchAllActivePartnersOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.romanticRelationshipType.isNotValue(
                  RomanticRelationshipType.none.name,
                ) &
                relationship.activeRomance.equals(true),
          ))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchAllChildrenOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.birthChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.adoptiveChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepChild),
                    )),
          ))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchAllExes(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.romanticRelationshipType.isNotValue(
                  RomanticRelationshipType.none.name,
                ) &
                relationship.activeRomance.equals(false),
          ))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchAllFriendsOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.platonicRelationshipType.equals(
                  PlatonicRelationshipType.friend.name,
                ) &
                relationship.romanticRelationshipType.equals(
                  RomanticRelationshipType.none.name,
                ),
          ))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchAllInLawsOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.siblingInLaw),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.parentInLaw),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.childInLaw),
                    )),
          ))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchAllParentsOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.birthParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.adoptiveParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepParent),
                    )),
          ))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchAllPartners(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.romanticRelationshipType.isNotValue(
                  RomanticRelationshipType.none.name,
                ),
          ))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchAllRelationshipsInvolving(int personID) {
    return (select(relationshipTable)
          ..where((relationship) =>
              (relationship.firstPersonId.equals(personID) |
                  relationship.secondPersonId.equals(personID))))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchAllRelativesOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.cousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.nibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.pibling),
                    )),
          ))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchAllSiblingsOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.halfSibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.fullSibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.adoptiveSibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepSibling),
                    )),
          ))
        .watch();
  }

  @override
  Stream<Relationship?> watchRelationship(int aPersonID, int bPersonID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                relationship.firstPersonId.equals(aPersonID) &
                relationship.secondPersonId.equals(bPersonID),
          )
          ..limit(1))
        .watchSingleOrNull();
  }

  @override
  Future<Relationship?> getMarriagePartnerRelationship(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.romanticRelationshipType
                    .equals(RomanticRelationshipType.married.name) &
                relationship.activeRomance.equals(true),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  @override
  Stream<Relationship?> watchMarriagePartnerRelationship(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.romanticRelationshipType
                    .equals(RomanticRelationshipType.married.name) &
                relationship.activeRomance.equals(true),
          )
          ..limit(1))
        .watchSingleOrNull();
  }
}
