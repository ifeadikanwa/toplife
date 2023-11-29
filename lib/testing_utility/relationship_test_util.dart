import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/dependencies/relationship/relationship_dependencies_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';

class RelationshipTestUtil {
  final WidgetRef ref;

  const RelationshipTestUtil({required this.ref});

  Future<void> linkparentToMultipleChildren({
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
