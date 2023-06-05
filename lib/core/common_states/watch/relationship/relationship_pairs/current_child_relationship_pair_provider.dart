import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/person/current_person_usecase.dart';
import 'package:toplife/core/common_states/watch/relationship/specific_relationships/current_child_relationship_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final currentChildRelationshipPairProvider = FutureProvider.family
    .autoDispose<RelationshipPair<Child>?, int>(
        (ref, relationshipPersonID) async {
  final Person? person =
      await ref.watch(currentPersonProvider(relationshipPersonID).future);

  final Child? child = await ref
      .watch(currentChildRelationshipProvider(relationshipPersonID).future);

  if (person != null && child != null) {
    return RelationshipPair<Child>(
      relationship: child,
      person: person,
      informalRelationshipType: InformalRelationshipType.child,
    );
  }

  return null;
});
