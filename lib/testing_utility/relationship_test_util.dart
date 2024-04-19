import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/platonic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/constants/romantic_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/util/get_db_formatted_platonic_relationship_type_string.dart';

class RelationshipTestUtil {
  final WidgetRef ref;

  const RelationshipTestUtil({required this.ref});

  Relationship generateTestRelationship(int firstId, int secondId) =>
      Relationship(
        firstPersonId: firstId,
        secondPersonId: secondId,
        platonicRelationshipType: getDbFormattedPlatonicRelationshipTypeString(
            PlatonicRelationshipType.childInLaw),
        romanticRelationshipType: RomanticRelationshipType.dating.toString(),
        previousFamilialRelationship:
            getDbFormattedPlatonicRelationshipTypeString(
                PlatonicRelationshipType.distantRelative),
        interestedInRelationship: true,
        level: 75,
        activeRomance: false,
        isCoParent: false,
        romanceStartDay: 1,
        romanceEndDay: 0,
        romanceCumulativeDuration: 9,
        jointMoney: 4000,
      );

  Future<void> linkParentToMultipleChildren({
    required int parentId,
    required List<int> childrenIDs,
    ParentChildLink? parentChildLinkTemplate,
  }) async {
    for (var childId in childrenIDs) {
      final ParentChildLink parentChildLink = parentChildLinkTemplate?.copyWith(
            parentId: parentId,
            childId: childId,
          ) ??
          ParentChildLink(
            parentId: parentId,
            childId: childId,
            isBirthRelationshipType: true,
            relatedToPlayerFamily: true,
            isHidden: false,
            isPaternityFraud: false,
          );

      await ref
          .watch(relationshipRepositoriesProvider)
          .parentChildLinkRepositoryImpl
          .createParentChildLink(parentChildLink);
    }
  }
}
