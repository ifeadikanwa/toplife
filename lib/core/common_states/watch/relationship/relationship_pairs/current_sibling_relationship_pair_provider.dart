import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/person/current_person_usecase.dart';
import 'package:toplife/core/common_states/watch/relationship/specific_relationships/current_sibling_relationship_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final currentSiblingRelationshipPairProvider = FutureProvider.family
    .autoDispose<RelationshipPair<Sibling>?, int>(
        (ref, relationshipPersonID) async {
  final Person? person =
      await ref.watch(currentPersonProvider(relationshipPersonID).future);

  final Sibling? sibling = await ref
      .watch(currentSiblingRelationshipProvider(relationshipPersonID).future);

  if (person != null && sibling != null) {
    return RelationshipPair<Sibling>(
      relationship: sibling,
      person: person,
      informalRelationshipType: InformalRelationshipType.sibling,
    );
  }

  return null;
});
