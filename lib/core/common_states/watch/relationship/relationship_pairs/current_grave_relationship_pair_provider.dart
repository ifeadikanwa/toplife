import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toplife/core/common_states/watch/person/current_person_usecase.dart';
import 'package:toplife/core/common_states/watch/relationship/specific_relationships/current_grave_relationship_provider.dart';
import 'package:toplife/core/data_source/drift_database/database_provider.dart';
import 'package:toplife/main_systems/system_relationship/constants/informal_relationship_type.dart';
import 'package:toplife/main_systems/system_relationship/domain/model/info_models/relationship_pair.dart';

final currentGraveRelationshipPairProvider = FutureProvider.family
    .autoDispose<RelationshipPair<Grave>?, int>(
        (ref, relationshipPersonID) async {
  final Person? person =
      await ref.watch(currentPersonProvider(relationshipPersonID).future);

  final Grave? grave = await ref
      .watch(currentGraveRelationshipProvider(relationshipPersonID).future);

  if (person != null && grave != null) {
    return RelationshipPair<Grave>(
      relationship: grave,
      person: person,
      informalRelationshipType: InformalRelationshipType.grave,
    );
  }

  return null;
});
