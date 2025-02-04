import 'package:drift/drift.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/core/utils/stats/cross_check_stats.dart';
import 'package:toplife/core/utils/stats/stats_range/stats_range_constants.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/relationship_constants.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/dao/relationship_dao.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/domain/model/relationship.dart';
import 'package:toplife/game_systems/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

part 'relationship_dao_impl.g.dart';

@DriftAccessor(tables: [RelationshipTable])
class RelationshipDaoImpl extends DatabaseAccessor<DatabaseProvider>
    with _$RelationshipDaoImplMixin
    implements RelationshipDao {
  RelationshipDaoImpl(super.database);

  //// some relationships are same level while others are multilevel.
  //// So sometimes it is important that the correct person is labeled main.
  // SCRAP EVERYTHING ABOVE.
  //It shouldn't matter who is main or other because that just creates room for error.
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

  //Only get friends with NO romantic relationship and NO previous familial relationship
  @override
  Future<List<Relationship>> getAllFriendsOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                relationship.platonicRelationshipType.contains(
                  getDbFormattedPlatonicRelationshipTypeString(
                      PlatonicRelationshipType.friend),
                ) &
                (relationship.previousFamilialRelationship.equals(
                  RelationshipConstants.defaultPreviousFamilialRelationship,
                )) &
                relationship.romanticRelationshipType.equals(
                  RomanticRelationshipType.none.name,
                ),
          ))
        .get();
  }

  //Past family are friends with previous familial relationships.
  //when a step or in law relationship ends we convert it to a friendship with previous familial relationship
  @override
  Future<List<Relationship>> getAllPastFamilyOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                  getDbFormattedPlatonicRelationshipTypeString(
                      PlatonicRelationshipType.friend),
                )) &
                (relationship.previousFamilialRelationship.isNotValue(
                    RelationshipConstants.defaultPreviousFamilialRelationship)),
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
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepChildInLaw),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepSiblingInLaw),
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
                          PlatonicRelationshipType.stepGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.cousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.nibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.pibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepPibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.distantRelative),
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
  Stream<List<Relationship>> watchAllExesOf(int personID) {
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
                relationship.platonicRelationshipType.contains(
                  getDbFormattedPlatonicRelationshipTypeString(
                      PlatonicRelationshipType.friend),
                ) &
                (relationship.previousFamilialRelationship.equals(
                  RelationshipConstants.defaultPreviousFamilialRelationship,
                )) &
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
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepChildInLaw),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepSiblingInLaw),
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
  Stream<List<Relationship>> watchAllPartnersOf(int personID) {
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
                          PlatonicRelationshipType.stepGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.cousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.nibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.pibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepPibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.distantRelative),
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

  @override
  Stream<List<Relationship>> watchAllPastFamilyOf(int personID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(personID) |
                    relationship.secondPersonId.equals(personID)) &
                (relationship.platonicRelationshipType.contains(
                  getDbFormattedPlatonicRelationshipTypeString(
                      PlatonicRelationshipType.friend),
                )) &
                (relationship.previousFamilialRelationship.isNotValue(
                    RelationshipConstants.defaultPreviousFamilialRelationship)),
          ))
        .watch();
  }

  @override
  Future<List<Relationship>> getChildrensTabRelationships(int playerID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(playerID) |
                    relationship.secondPersonId.equals(playerID)) &
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
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandChild),
                    )),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getParentsTabRelationships(int playerID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(playerID) |
                    relationship.secondPersonId.equals(playerID)) &
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
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandParent),
                    )),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getPartnersTabRelationships(int playerID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                //this has to be true:
                //it has to be a valid romantic relationship
                ((relationship.firstPersonId.equals(playerID) |
                        relationship.secondPersonId.equals(playerID)) &
                    relationship.romanticRelationshipType.isNotValue(
                      RomanticRelationshipType.none.name,
                    ))

                //AND
                &

                //one of these has to be true:
                (
                    //the romantic relationship is active
                    (relationship.activeRomance.equals(true))
                        //OR
                        |
                        //the romantic relationship is NOT active AND the person is a coparent
                        (relationship.activeRomance.equals(false) &
                            relationship.isCoParent.equals(true))
                //
                ),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getRelativesTabRelationships(int playerID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(playerID) |
                    relationship.secondPersonId.equals(playerID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.pibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepPibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.cousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.distantRelative),
                    )),
          ))
        .get();
  }

  @override
  Future<List<Relationship>> getSiblingsTabRelationships(int playerID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(playerID) |
                    relationship.secondPersonId.equals(playerID)) &
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
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.nibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandNibling),
                    )),
          ))
        .get();
  }

  @override
  Stream<List<Relationship>> watchChildrensTabRelationships(int playerID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(playerID) |
                    relationship.secondPersonId.equals(playerID)) &
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
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandChild),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandChild),
                    )),
          ))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchParentsTabRelationships(int playerID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(playerID) |
                    relationship.secondPersonId.equals(playerID)) &
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
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandParent),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandParent),
                    )),
          ))
        .watch();
  }

  //I allow flings to be included in the active partners relationship
  //Active flings will be reserved for friendships that turn romantic, so that they have a place to appear that isnt the exes tab
  //Dating app hookups will not be given this privilege, they will go straight to the exes tab.
  //The player should have an option to end an active fling so they have the opportunity to clear flings from the active partners tab.

  @override
  Stream<List<Relationship>> watchPartnersTabRelationships(int playerID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                //this has to be true:
                //it has to be a valid romantic relationship
                ((relationship.firstPersonId.equals(playerID) |
                        relationship.secondPersonId.equals(playerID)) &
                    relationship.romanticRelationshipType.isNotValue(
                      RomanticRelationshipType.none.name,
                    ))

                //AND
                &

                //one of these has to be true:
                (
                    //the romantic relationship is active
                    (relationship.activeRomance.equals(true))
                        //OR
                        |
                        //the romantic relationship is NOT active AND the person is a coparent
                        (relationship.activeRomance.equals(false) &
                            relationship.isCoParent.equals(true))
                //
                ),
          ))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchRelativesTabRelationships(int playerID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(playerID) |
                    relationship.secondPersonId.equals(playerID)) &
                (relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.pibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepPibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.cousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandCousin),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.distantRelative),
                    )),
          ))
        .watch();
  }

  @override
  Stream<List<Relationship>> watchSiblingsTabRelationships(int playerID) {
    return (select(relationshipTable)
          ..where(
            (relationship) =>
                (relationship.firstPersonId.equals(playerID) |
                    relationship.secondPersonId.equals(playerID)) &
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
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.nibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.grandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGrandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.greatGrandNibling),
                    ) |
                    relationship.platonicRelationshipType.contains(
                      getDbFormattedPlatonicRelationshipTypeString(
                          PlatonicRelationshipType.stepGreatGrandNibling),
                    )),
          ))
        .watch();
  }
}
